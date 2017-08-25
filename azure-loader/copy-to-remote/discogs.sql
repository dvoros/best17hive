drop database if exists discogs cascade;
create database discogs;
use discogs;

DROP TABLE IF EXISTS discogs_release_text;
CREATE EXTERNAL TABLE discogs_release_text(artist_names ARRAY<STRING>, label_names ARRAY<STRING>,
 title STRING, genres ARRAY<STRING>, styles ARRAY<STRING>, country STRING, released STRING)
STORED AS TEXTFILE
LOCATION '/data/discogs_release_text';

DROP TABLE IF EXISTS discogs_artist_text;
CREATE EXTERNAL TABLE discogs_artist_text(name STRING, realname STRING, namevariations ARRAY<STRING>,
  aliases ARRAY<STRING>, profile STRING, members ARRAY<STRING>, groups ARRAY<STRING>,
  images ARRAY<STRING>, urls ARRAY<STRING>)
STORED AS TEXTFILE
LOCATION '/data/discogs_artist_text';

DROP TABLE IF EXISTS discogs_label_text;
CREATE EXTERNAL TABLE discogs_label_text(name STRING, parentlabel STRING,
  sublabels ARRAY<STRING>, contactinfo STRING,
  profile STRING, images ARRAY<STRING>, urls ARRAY<STRING>)
STORED AS TEXTFILE
LOCATION '/data/discogs_label_text';
