drop database if exists discofull cascade;
create database discofull;
use discofull;

DROP TABLE IF EXISTS discogs_release_text;
CREATE EXTERNAL TABLE discogs_release_text(artist_names ARRAY<STRING>, label_names ARRAY<STRING>,
 title STRING, genres ARRAY<STRING>, styles ARRAY<STRING>, country STRING, released STRING)
STORED AS TEXTFILE
LOCATION '/data/discogs_release_text'
;
