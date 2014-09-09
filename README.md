Apache Tez on Docker
==========

This repository contains a docker file to build a docker image with Apache Tez. This docker image depends on our previous Hadoop docker image, available at the SequenceIQ GitHub page.
The base Hadoop docker image is also available as an official Docker image (sequenceiq/hadoop-docker).

## Building the image
```
docker build  -t sequenceiq/tez:v0.5onHadoop2.5 .
```

## Running the image
```
docker run -i -t -P sequenceiq/tez:v0.5onHadoop2.5 /etc/bootstrap.sh -bash
```

## Versions
Apache Hadoop 2.5  
Apache Tez 0.5.0  

## Testing
When running one of the stock map-reduce examples, the TEZ DAG ApplicationMaster will run the map-reduce job instead of the YARN MR AppMaster.
This can be verified by looking at the YARN ResourceManager UI.
```
$HADOOP_PREFIX/bin/hadoop jar $HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.5.0.jar grep input output 'dfs[a-z.]+'
```

There is also a basic Tez MRR job example in one of the tez jars. You can test it by running the following:
```
$HADOOP_PREFIX/bin/hadoop jar /usr/local/tez/tez-examples-0.5.0.jar orderedwordcount input output-owc 
```
