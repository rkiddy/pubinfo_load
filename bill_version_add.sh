#!/bin/sh

if [ "$1" = "" ] || [ ! -d data/$1 ]; then
    echo ""
    echo "Cannot find directory: ./data/$1. Aborting."
    echo
    exit 1
fi

cd data/$1

dir=`pwd`

db=$1

if [ ! -f BILL_VERSION_TBL.dat ]; then
    echo ""
    echo "ERROR, cannot find BILL_VERSION_TBL.dat file. Aborting."
    echo ""
    exit 1
fi

echo ""

mysql -vvv --local-infile --max_allowed_packet=100M $db < ../../bill_version_tbl.sql

echo ""

exit 0
