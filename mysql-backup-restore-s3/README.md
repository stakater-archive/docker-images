Based on Ubuntu 16.04 LTS Xenial

The image offers following features:

1. backup of mysql database
2. upload of mysql backup to s3
3. download mysql backup from s3
4. restore s3 backup

Build an image:
If you are using local Docker, following command will build a local image, skip this setup if you want to get the latest image from the docker hub.

`docker build -t stakater/mysql-backup-restore-s3 .`


Run the latest container with:

`docker run stakater/mysql-backup-restore-s3`

If the image isn't found locally it will automatically pull from the docker hub.

Run and link the container with the mysql container from where it will clone the backup and upload to S3:

`docker run -d --link mysqlbackuprestores3_mysql_1:mysql -v $PWD:/backup -e CRON_TIME="*/2 * * * *" -e MYSQL_USER=root -e MYSQL_PASS=dbpass -e S3_BUCKET_NAME=you_bucket_unique_name -e AWS_ACCESS_KEY_ID=your_access_id -e AWS_SECRET_ACCESS_KEY="your_secret_key" -e AWS_DEFAULT_REGION=your_bucket_region -e LAST_BACKUP=20160824.sql stakater/mysql-backup-restore-s3`

You can override the already set environment variable by passing them as parameter shown above.
You can get AWS_ID and AWS_SECRET_ACCESS_KEY from your developer aws console.
Your bucket name should be unique universally.
The LAST_BACKUP is set if you want to a specific restore point, else remove this and it will automatically fetch and restore the last uploaded backup.
If you dont want to restore backup set "-e RESTORE=false" in above command as it is set TRUE by default.

Push an image if you changed anything locally:

`sudo docker push stakater/mysql-backup-restore-s3`
