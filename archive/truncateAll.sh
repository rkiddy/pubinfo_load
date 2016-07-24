#!/bin/bash
#--------------------------------------------------------------------+
# Usage: truncateAll.sh
#
#   Truncate all tables in the capublic MySQL database
#
# ---When---  ----Who----  ----------------What----------------------
# 2016-02-17  LDC          Written.
#
#--------------------------------------------------------------------+
if [ $# -gt 0 ]; then
  echo Usage: ./truncateAll.sh
  exit 1
fi

if [ -z "$MYSQL_PWD" ]; then
  read -p "Please enter root password:" MYSQL_PWD
  export MYSQL_PWD=${MYSQL_PWD}
fi

#-- Truncate all tables
if [ -z "$MYSQL_PWD" ]; then
  mysql -hlocalhost -uroot -p -Dcapublic -v -v -f < truncateAll.sql 2>&1 | tee truncateAll.log
else
  mysql -hlocalhost -uroot    -Dcapublic -v -v -f < truncateAll.sql 2>&1 | tee truncateAll.log
fi

echo done...

#-----------------  E N D   O F  C O D E  ---------------------------+
