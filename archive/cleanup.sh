#!/bin/bash
#--------------------------------------------------------------------+
# Usage: cleanup.sh
#
#   clean all old extract data in /home/pubinfo directory.
#
# ---When---  ----Who----  ----------------What----------------------
# 2016-02-17  LDC          Written.
#
#--------------------------------------------------------------------+
if [ $# -gt 0 ]; then
  echo Usage: ./cleanup.sh
  exit 1
fi

#-- remove all *.dat *.lob files
rm /home/pubinfo/*_TBL.dat  2> /dev/null
rm /home/pubinfo/*_TBL*.lob 2> /dev/null

echo done...
#-----------------  E N D   O F  C O D E  ---------------------------+
