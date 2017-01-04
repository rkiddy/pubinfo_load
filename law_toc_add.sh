#!/bin/sh

if [ "$1" = "" ] || [ ! -d data/$1 ]; then
    echo ""
    echo "Cannot find directory: ./data/$1. Aborting."
    echo
    exit 1
fi

cd data/$1

db=$1

if [ ! -f LAW_TOC_TBL.dat ]; then
    echo ""
    echo "ERROR, cannot find LAW_TOC_TBL.dat file. Aborting."
    echo ""
    exit 1
fi

wc -l LAW_TOC_TBL.dat
echo ""

mysql -vvv --local-infile --max_allowed_packet=100M $db < ../../law_toc_tbl.sql

echo ""

exit 0
