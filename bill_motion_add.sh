#!/bin/sh

if [ "$1" = "" ] || [ ! -d data/$1 ]; then
    echo ""
    echo "Cannot find directory: ./data/$1. Aborting."
    echo
    exit 1
fi

cd data/$1

db=$1

if [ ! -f BILL_MOTION_TBL.dat ]; then
    echo ""
    echo "ERROR, cannot find BILL_MOTION_TBL.dat file. Aborting."
    echo ""
    exit 1
fi

wc -l BILL_MOTION_TBL.dat
echo ""

mysql -vvv --local-infile --max_allowed_packet=100M $db < ../../bill_motion_tbl.sql

echo ""

exit 0
