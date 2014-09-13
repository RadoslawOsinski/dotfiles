#!/bin/bash
# to jest skrypt backupujący bazę danych postgres

export PG_HOME=/Library/PostgreSQL/8.4
export PG_BIN=$PG_HOME/bin
export BACKUP_DIR=$PG_HOME/db_dump
export PGPASSWORD=fuck you

cd $BACKUP_DIR
for DB in test1 test2
do
	export NOW=`date +%Y%m%d-%H%M`
	export ERR_LOG=${DB}-${NOW}.error
	export LOG=${DB}-${NOW}.log

	{
        	echo -ne "START: "
        	date +%H%M
        	echo
        	${PG_BIN}/pg_dump -U $DB $DB 2>>$ERR_LOG | gzip >$DB-${NOW}.sql.gz 2>>$ERR_LOG
        	date +%H%M
        	echo
	} >$LOG	
done

