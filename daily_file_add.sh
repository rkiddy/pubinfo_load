#!/bin/sh

if [ "$1" = "" ] || [ ! -d data/$1 ]; then
    echo ""
    echo "Cannot find directory: ./data/$1. Aborting."
    echo
    exit 1
fi

cd data/$1

db=$1

if [ ! -f DAILY_FILE_TBL.dat ]; then
    echo ""
    echo "ERROR, cannot find DAILY_FILE_TBL.dat file. Aborting."
    echo ""
    exit 1
fi

wc -l DAILY_FILE_TBL.dat
echo ""

mysql -vvv --local-infile --max_allowed_packet=100M $db < ../../daily_file_tbl.sql

echo ""

exit 0
