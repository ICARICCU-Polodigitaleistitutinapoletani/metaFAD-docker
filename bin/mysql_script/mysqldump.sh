#!/bin/bash

DATABASE=$1
TIMESTAMP=$(date +"%Y%m%d%H%M")
MYSQLDUMP=$(which mysqldump)

if [  $# -eq 0 ]
then
        echo -e "Usage: ./mysqldump.sh <database>"
		exit -1
fi

if [ -z "$DATABASE" ]
then
        echo -e "Database is required\n"
        exit -1
fi

if [ -z "$MYSQLDUMP" ]
then
	echo -e "mysqldump command is required\n"
        exit -1
fi

${MYSQLDUMP} -uroot -p${MYSQL_ROOT_PASSWORD} --no-create-db --databases ${DATABASE} > /mysql_dump/${DATABASE}-${TIMESTAMP}.sql

echo -e "Dump saved into /mysql-dump/${DATABASE}-${TIMESTAMP}.sql\n"

exit 0
