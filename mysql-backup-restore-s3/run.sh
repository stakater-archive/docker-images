#!/bin/bash
export PATH=$PATH:/usr/bin:/usr/local/bin:/bin
	
if [ "${MYSQL_ENV_MYSQL_PASS}" == "**Random**" ]; then
        unset MYSQL_ENV_MYSQL_PASS
fi

MYSQL_HOST=${MYSQL_PORT_3306_TCP_ADDR:-${MYSQL_HOST}}
MYSQL_HOST=${MYSQL_PORT_1_3306_TCP_ADDR:-${MYSQL_HOST}}
MYSQL_PORT=${MYSQL_PORT_3306_TCP_PORT:-${MYSQL_PORT}}
MYSQL_PORT=${MYSQL_PORT_1_3306_TCP_PORT:-${MYSQL_PORT}}
MYSQL_USER=${MYSQL_USER:-${MYSQL_ENV_MYSQL_USER}}
MYSQL_PASS=${MYSQL_PASS:-${MYSQL_ENV_MYSQL_PASS}}

[ -z "${MYSQL_HOST}" ] && { echo "=> MYSQL_HOST cannot be empty" && exit 1; }
echo "=> MYSQL_HOST ${MYSQL_HOST}" 

[ -z "${MYSQL_PORT}" ] && { echo "=> MYSQL_PORT cannot be empty" && exit 1; }
echo "=> MYSQL_PORT ${MYSQL_PORT}" 

[ -z "${MYSQL_USER}" ] && { echo "=> MYSQL_USER cannot be empty" && exit 1; }
[ -z "${MYSQL_PASS}" ] && { echo "=> MYSQL_PASS cannot be empty" && exit 1; }

BACKUP_CMD="mysqldump -h${MYSQL_HOST} -P${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASS} ${EXTRA_OPTS} ${MYSQL_DB} > /backup/"'${BACKUP_NAME}'

echo "=> Creating backup script"
rm -f /backup.sh
cat <<EOF >> /backup.sh
#!/bin/bash
export PATH=$PATH:/usr/bin:/usr/local/bin:/bin

MAX_BACKUPS=${MAX_BACKUPS}

BACKUP_NAME=\$(date +\%Y.\%m.\%d.\%H\%M\%S).sql

echo "=> Backup started: \${BACKUP_NAME}"
if ${BACKUP_CMD} ;then
    echo "   Backup succeeded"
else
    echo "   Backup failed"
    rm -rf /backup/\${BACKUP_NAME}
fi

if [ -n "\${MAX_BACKUPS}" ]; then
    while [ \$(ls /backup -N1 | wc -l) -gt \${MAX_BACKUPS} ];
    do
        BACKUP_TO_BE_DELETED=\$(ls /backup -N1 | sort | head -n 1)
        echo "   Backup \${BACKUP_TO_BE_DELETED} is deleted"
        rm -rf /backup/\${BACKUP_TO_BE_DELETED}
    done
fi
echo "=> Backup done"

if ${BACKUP_CMD} ;then
    echo "=> Upload to s3 started: \${BACKUP_NAME}"

    # Create bucket, if it doesn't already exist
    BUCKET_EXIST=\$(aws s3 --region \${AWS_DEFAULT_REGION} ls | grep \${S3_BUCKET_NAME} | wc -l)
    if [ \${BUCKET_EXIST} -eq 0 ];
    then
      aws s3 --region \${AWS_DEFAULT_REGION} mb s3://\${S3_BUCKET_NAME}
    fi

    # Upload the backup to S3 with timestamp
    aws s3 --region \${AWS_DEFAULT_REGION} cp /backup/\${BACKUP_NAME} s3://\${S3_BUCKET_NAME}/\${BACKUP_NAME}

    echo "=> Upload to s3 done"

    echo "=> Cleanup started: \${BACKUP_NAME}"
        rm -rf /backup/\${BACKUP_NAME}
    echo "=> Cleanup done"
fi
EOF
chmod +x /backup.sh

echo "=> Creating restore script"
rm -f /restore.sh
cat <<EOF >> /restore.sh
#!/bin/bash
    BUCKET_EXIST=\$(aws s3 --region \${AWS_DEFAULT_REGION} ls | grep \${S3_BUCKET_NAME} | wc -l)
    if [ \${BUCKET_EXIST} -eq 0 ];
    then
      echo "Bucket Doesnt Exist"
      exit 1
    fi

    if [ -z "\${LAST_BACKUP}" ]; then
    # Find last backup file
    : ${LAST_BACKUP:=$(aws s3 ls s3://$S3_BUCKET_NAME | awk -F " " '{print $4}' | sort -r | head -n1)}
    fi
    
    # Download backup from S3
    echo "=> Restore from S3 => $LAST_BACKUP"
    aws s3 cp s3://$S3_BUCKET_NAME/$LAST_BACKUP $LAST_BACKUP
    echo "=> Restore database from \$1"
    if mysql -h${MYSQL_HOST} -P${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASS} --database=${MYSQL_DB} < \/$LAST_BACKUP ;then
    echo "   Restore succeeded"
    else
    echo "   Restore failed"
    fi
    echo "=> Done"
EOF
chmod +x /restore.sh

touch /mysql_backup.log
tail -F /mysql_backup.log &

if [ -n "${INIT_BACKUP}" ]; then
    echo "=> Create a backup on the startup"
    /backup.sh
fi

if [[ "$RESTORE" == "true" ]]; then
  ./restore.sh
fi

echo "${CRON_TIME} export S3_BUCKET_NAME=${S3_BUCKET_NAME}; export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}; export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}; export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}; /backup.sh >> /mysql_backup.log 2>&1" > /crontab.conf
crontab  /crontab.conf
echo "=> Running cron job"
exec cron -f
