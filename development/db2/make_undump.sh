#!/bin/sh

usage() {
    echo "###########################################################################"
    echo "Usage: ./make_ubuntu.sh <DUMP_FILE>.zip <DB_NAME>"
    echo "###########################################################################"
}

if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

DUMP_FILE=$1
DB_NAME=$2

echo "#### Performing undump form $DUMP_FILE into database $DB_NAME"


DIR=$(dirname $0)
echo "#### DIR: $DIR"

TMP_DIR="$DIR/dump"
mkdir $TMP_DIR
DDL_FILE="$TMP_DIR/ddl.sql"

# unpacking dump files without directory structure
unzip -j $DUMP_FILE -d $TMP_DIR

# checking data base connection in ddl.sql
tmp=$(grep "CONNECT TO $DB_NAME;" $DDL_FILE | wc -l)
#echo "## tmp: $tmp"
if [ "$tmp"=="0" ]; then
    echo "###########################################################################"
    echo "#### REPLACING DATA BASE NAME TO WHICH CONNECTION IS OPENING ON $DB_NAME"
    echo "###########################################################################"

    sed -ie "s/CONNECT TO .*$/CONNECT TO $DB_NAME;/g" $DDL_FILE
fi

# importing data into data base
cd $TMP_DIR
db2move $DB_NAME IMPORT
db2 -t < ddl.sql
db2 -t < sequences_ddl.sql
