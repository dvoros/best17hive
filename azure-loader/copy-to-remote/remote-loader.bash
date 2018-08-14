#!/bin/bash

DATA_DIR=/tmp/loader/data

# Download data
mkdir $DATA_DIR
cd $DATA_DIR
wget -q https://asdasd.hu/hive-workshop/tpcds_1g.tar.gz
tar xzf tpcds_1g.tar.gz
wget -q https://asdasd.hu/hive-workshop/police_data.tar.gz
tar xzf police_data.tar.gz
wget -q https://asdasd.hu/hive-workshop/discogs_20170801_releases_text.tar.gz
tar xzf discogs_20170801_releases_text.tar.gz
wget -q https://asdasd.hu/hive-workshop/discogs_20170801_artists_text.tar.gz
tar xzf discogs_20170801_artists_text.tar.gz
wget -q https://asdasd.hu/hive-workshop/discogs_20170801_labels_text.tar.gz
tar xzf discogs_20170801_labels_text.tar.gz
rm *.tar.gz

# Put on HDFS
sudo -u hdfs hdfs dfs -rm -r -f /data
sudo -u hdfs hdfs dfs -copyFromLocal /tmp/loader/data /

# Create schema
beeline -u 'jdbc:hive2://localhost:10001/default;transportMode=http' -f /tmp/loader/cleanup.sql
beeline -u 'jdbc:hive2://localhost:10001/default;transportMode=http' -f /tmp/loader/police.sql
beeline -u 'jdbc:hive2://localhost:10001/default;transportMode=http' -f /tmp/loader/tpcds.sql
beeline -u 'jdbc:hive2://localhost:10001/default;transportMode=http' -f /tmp/loader/discogs.sql

echo remote ok
