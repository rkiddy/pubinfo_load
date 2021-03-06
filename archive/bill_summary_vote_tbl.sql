LOAD DATA LOCAL
  INFILE "BILL_SUMMARY_VOTE_TBL.dat"
  REPLACE
  INTO TABLE capublic.bill_summary_vote_tbl
  FIELDS TERMINATED BY '\t'
  OPTIONALLY ENCLOSED BY '`'
  LINES TERMINATED BY '\n'
(
   BILL_ID
  ,LOCATION_CODE
  ,VOTE_DATE_TIME
  ,VOTE_DATE_SEQ
  ,MOTION_ID
  ,AYES
  ,NOES
  ,ABSTAIN
  ,VOTE_RESULT
  ,TRANS_UID
  ,TRANS_UPDATE
  ,FILE_ITEM_NUM
  ,FILE_LOCATION
  ,DISPLAY_LINES
  ,SESSION_DATE
)
