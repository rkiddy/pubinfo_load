LOAD DATA LOCAL
  INFILE "LEGISLATOR_TBL.dat"
  REPLACE
  INTO TABLE legislator_tbl
  FIELDS TERMINATED BY '\t'
  OPTIONALLY ENCLOSED BY '`'
  LINES TERMINATED BY '\n'
(
   DISTRICT
  ,SESSION_YEAR
  ,LEGISLATOR_NAME
  ,HOUSE_TYPE
  ,AUTHOR_NAME
  ,FIRST_NAME
  ,LAST_NAME
  ,MIDDLE_INITIAL
  ,NAME_SUFFIX
  ,NAME_TITLE
  ,WEB_NAME_TITLE
  ,PARTY
  ,ACTIVE_FLG
  ,TRANS_UID
  ,TRANS_UPDATE
  ,ACTIVE_LEGISLATOR
)
