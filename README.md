Apache Tez on Docker
==========

This repository contains a docker file to build a docker image with Apache Tez. This docker image depends on our previous Hadoop docker image, available at the SequenceIQ GitHub page.
The base Hadoop docker image is also available as an official Docker image (sequenceiq/hadoop-docker).

## Running the image
```
docker run -i -t -P sequenceiq/tez-docker /etc/bootstrap.sh -bash
```

## Versions
Hadoop 2.3 and Apache Tez 0.3.0-incubating

## Testing
When running one of the stock map-reduce examples, the TEZ DAG ApplicationMaster will run the map-reduce job instead of the YARN MR AppMaster.
This can be verified by looking at the YARN ResourceManager UI.
```
$HADOOP_PREFIX/bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.3.0.jar grep input output 'dfs[a-z.]+'
```

There is also a basic Tez MRR job example in one of the tez jars. You can test it by running the following:
```
$HADOOP_PREFIX/bin/hadoop jar /usr/local/tez/tez-mapreduce-examples-0.3.0-incubating.jar  orderedwordcount input output-owc
```
