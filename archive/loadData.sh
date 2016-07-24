#!/bin/bash
#--------------------------------------------------------------------+
# Usage: loadData.sh
#
#   load pubinfo data into the mysql database.
#
# ---When---  ----Who----  ----------------What----------------------
# 2015-06-02  LDC          Written.
#
#--------------------------------------------------------------------+
if [ $# -gt 0 ]; then
  echo Usage: ./loadData.sh
  exit 1
fi

if [ -z "$MYSQL_PWD" ]; then
  read -p "Please enter root password:" MYSQL_PWD
  export MYSQL_PWD=${MYSQL_PWD}
fi

#-- read table names and load if there is a .dat file for it
while read lcTable
do
  if [ -e ${lcTable}.dat ]; then
    echo Processing table: ${lcTable}
    if [ -z "$MYSQL_PWD" ]; then
      mysql -uroot -p -Dcapublic -v -v -f < ${lcTable}.sql 2>&1 > ${lcTable}.log
    else
      mysql -uroot    -Dcapublic -v -v -f < ${lcTable}.sql 2>&1 > ${lcTable}.log
    fi
  fi
done < "tables_lc.lst"

#-----------------  E N D   O F  C O D E  ---------------------------+
