#!/bin/bash
#--------------------------------------------------------------------+
# Usage: create_capublic.sh
#
#   Create capublic tables.
#
# ---When---  ----Who----  ----------------What----------------------
# 2016-02-17  LDC          Written.
#
#--------------------------------------------------------------------+
if [ $# -gt 0 ]; then
  echo Usage: ./create_capublic.sh
  exit 1
fi

if [ -z "$MYSQL_PWD" ]; then
  read -p "Please enter root password:" MYSQL_PWD
    export MYSQL_PWD=${MYSQL_PWD}
fi

if [ -z "$MYSQL_PWD" ]; then
  mysql -hlocalhost -uroot -p -v -v -f < capublic.sql 2>&1 | tee create_capublic.log
else
  mysql -hlocalhost -uroot    -v -v -f < capublic.sql 2>&1 | tee create_capublic.log
fi

echo done...

#-----------------  E N D   O F  C O D E  ---------------------------+
