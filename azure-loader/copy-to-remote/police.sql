drop database if exists police cascade;
create database police;
CREATE EXTERNAL TABLE police.input_police(
  incidntnum string,
  category string,
  description string,
  dayofweek string,
  datum string,
  time string,
  pddistrict string,
  resolution string,
  address string,
  x string,
  y string,
  location string,
  pdid string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location   '/data/txt_police'
;

create table police.txt_police as
select * from police.input_police where incidntnum!='IncidntNum';

create table police.orc_police stored as orc as
select * from police.input_police where incidntnum!='IncidntNum';
