#!/bin/sh

DB_NAME=unibox_d
if [ "$1" != "" ]; then
    DB_NAME=$1
fi
echo "#### Performing a dump form the database $DB_NAME"

DIR=$(dirname $0)
echo "#### dir: $DIR"

# exporting db2 data
TMP_DIR="$DIR/dump"
mkdir $TMP_DIR
cd $TMP_DIR
db2move $DB_NAME EXPORT
db2look -d $DB_NAME -e > ddl.sql
# przewijanie sekwencji bo db2look z tym sobie nie radzi
echo "connect to $DB_NAME;" > sequences_ddl.sql
echo "connect to $DB_NAME
select 'alter sequence '||seqname||' restart with '||nextcachefirstvalue||';' from syscat.sequences" | db2 >> sequences_ddl.sql
echo ";" >> sequences_ddl.sql
echo "COMMIT WORK;" >> sequences_ddl.sql
echo "TERMINATE;" >> sequences_ddl.sql

# packing data
#cd $DIR
cd ..
zip -r ${DB_NAME}_`date +%F~%T`.zip $TMP_DIR
rm -rf $TMP_DIR
