LOAD DATA LOCAL
  INFILE "BILL_VERSION_AUTHORS_TBL.dat"
  REPLACE
  INTO TABLE bill_version_authors_tbl
  FIELDS TERMINATED BY '\t'
  OPTIONALLY ENCLOSED BY '`'
  LINES TERMINATED BY '\n'
(
   BILL_VERSION_ID
  ,TYPE
  ,HOUSE
  ,NAME
  ,CONTRIBUTION
  ,COMMITTEE_MEMBERS
  ,ACTIVE_FLG
  ,TRANS_UID
  ,TRANS_UPDATE
  ,PRIMARY_AUTHOR_FLG
)
