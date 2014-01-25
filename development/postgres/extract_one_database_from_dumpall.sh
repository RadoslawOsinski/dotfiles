#!/bin/sh
 
if [ $# -ne 2 ]
then
	echo "Usage: $0 <postgresql sql dump> <db_name>" >&2
	exit 1
fi
 
db_file=$1
db_name=$2

if [ ! -f $db_file -o ! -r $db_file ]
then
	echo "error: $db_file not found or not readable" >&2
	exit 2
fi
 
grep -b "^\connect" $db_file | grep -m 1 -A 1 "$db_name$" | while read line
do
	bytes=`echo $line | cut -d: -f1`
 
	if [ -z "$start_point" ]
	then
		start_point=$bytes
	else
		end_point=$bytes
	fi
done
 
echo $start_point $end_point
if [ -z "$start_point" -o -z "$end_point" ]
then
	echo "error: start or end not found" >&2
	exit 3
fi
 
db_length=`expr $end_point - $start_point`
 
tail -c +$start_point $db_file | head -c $db_length | tail +3
