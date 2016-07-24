#!/bin/bash
#--------------------------------------------------------------------+
# Usage: deleteSession.sh
#
#   Delete desired session from capublic tables.
#
# ---When---  ----Who----  ----------------What----------------------
# 2016-02-17  LDC          Written.
#
#--------------------------------------------------------------------+
if [ $# -gt 0 ]; then
  echo Usage: ./deleteSession.sh
  exit 1
fi

clear
read -p "Please enter session year to delete:" sey

cat << _EOF > deleteSession.sql
tee deleteSession.log
use \`capublic\`;
Delete From capublic.bill_analysis_tbl         Where bill_id like '${sey}%';
Delete From capublic.bill_detail_vote_tbl      Where bill_id like '${sey}%';
Delete From capublic.bill_history_tbl          Where bill_id like '${sey}%';
Delete From capublic.bill_summary_vote_tbl     Where bill_id like '${sey}%';
Delete From capublic.bill_tbl                  Where bill_id like '${sey}%';
Delete From capublic.bill_version_authors_tbl  Where bill_version_id like '${sey}%';
Delete From capublic.bill_version_tbl          Where bill_version_id like '${sey}%';
Delete From capublic.committee_hearing_tbl     Where bill_id like '${sey}%';
Delete From capublic.daily_file_tbl            Where bill_id like '${sey}%';
Delete From capublic.legislator_tbl            Where session_year like '${sey}%';
Delete From capublic.location_code_tbl         Where session_year like '${sey}%';
Delete From capublic.veto_message_tbl          Where bill_id like '${sey}%';
Commit;
Quit
_EOF

read -p "Are you sure you want to delete ALL records for session year ${sey}? [y/n]:" ans
if [ "$ans" != "y" ]; then
  echo aborted...
  exit 1
fi

if [ -z "$MYSQL_PWD" ]; then
  read -p "Please enter root password:" MYSQL_PWD
  export MYSQL_PWD=${MYSQL_PWD}
fi

if [ -z "$MYSQL_PWD" ]; then
  mysql -hlocalhost -uroot -p -Dcapublic -v -v -f < deleteSession.sql 2>&1 | tee deleteSession.log
else
  mysql -hlocalhost -uroot    -Dcapublic -v -v -f < deleteSession.sql 2>&1 | tee deleteSession.log
fi

echo done...

#-----------------  E N D   O F  C O D E  ---------------------------+
