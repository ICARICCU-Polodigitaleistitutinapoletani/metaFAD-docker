#!/bin/bash

DATABASE=$1
DUMP=$2
MYSQL=$(which mysql)

if [  $# -eq 0 ] || [ -z "$DUMP" ] || [ -z "$DATABASE" ]
then
        echo -e "Usage: ./mysqlrestore.sh <database> <dump.sql>\n"
	echo -e "Dump available:"
	echo $(ls -l /mysql_dump | awk '{print $9}')
	exit -1
fi

if [ -z "$DATABASE" ]
then
        echo -e "Database name is required\n"
        exit -1
fi

if [ -z "$MYSQL" ]
then
	echo -e "mysql command is required\n"
        exit -1
fi

${MYSQL} -uroot -p${MYSQL_ROOT_PASSWORD} --database=${DATABASE} < /mysql_dump/${DUMP}

exit 0

