cat > avrodataread.hql

drop table tweets;
CREATE TABLE tweets
  ROW FORMAT SERDE
     'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
  STORED AS INPUTFORMAT
     'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
  OUTPUTFORMAT
     'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
  TBLPROPERTIES ('avro.schema.url'='file:///etc/flume-ng/conf/TwitterDataAvroSchema.avsc') ;

LOAD DATA INPATH '/user/cloudera/twitter_data/*/FlumeData.*' OVERWRITE INTO TABLE tweets;

hive - f avrodataread.hql

#Login to hive terminal through below command

hive

desc tweets;
