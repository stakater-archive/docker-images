Based on Ubuntu 16.04 LTS Xenial

The images offers following features:

1. backup of mysql database
2. upload of mysql backup to s3
3. download mysql backup from s3
4. restore s3 backup

Run the latest container with:

`docker run stakater/mysql-backup-restore-s3`

Build an image:
`docker build -t stakater/mysql-backup-restore-s3 .`

Push an image:
`sudo docker push stakater/mysql-backup-restore-s3`

"*/2 * * * *"

    docker run -d \
        --env MYSQL_HOST=mysql.host \
        --env MYSQL_PORT=27017 \
        --env MYSQL_USER=admin \
        --env MYSQL_PASS=password \
        --volume host.folder:/backup
        tutum/mysql-backup


docker run -d --env MYSQL_HOST=localhost --env MYSQL_PORT=3306 --env MYSQL_USER=root --env MYSQL_PASS= --volume $PWD:/backup --env 
CRON_TIME="*/2 * * * *" --env MYSQL_DB=pliro stakater/mysql-backup-restore-s3

docker run -d --link mysqlbackuprestores3_mysql_1:mysql -v $PWD:/backup -e CRON_TIME="*/2 * * * *" -e MYSQL_USER=root -e MYSQL_PASS=dbpass stakater/mysql-backup-restore-s3