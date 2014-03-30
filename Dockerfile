FROM sequenceiq/hadoop-docker
MAINTAINER SequenceIQ

RUN curl -s https://s3-eu-west-1.amazonaws.com/seq-tez/tez-0.3.0-incubating.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s tez-0.3.0-incubating tez
RUN $BOOTSTRAP && $HADOOP_PREFIX/bin/hadoop dfsadmin -safemode leave && $HADOOP_PREFIX/bin/hdfs dfs -put /usr/local/tez-0.3.0-incubating /tez

ADD tez-site.xml $HADOOP_PREFIX/etc/hadoop/tez-site.xml
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml

RUN echo 'TEZ_JARS=/usr/local/tez/*' >> hadoop-env.sh
RUN echo 'TEZ_LIB=/usr/local/tez/lib/*' >> hadoop-env.sh
RUN echo 'TEZ_CONF=/usr/local/hadoop/etc/hadoop' >> hadoop-env.sh
RUN echo 'export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$TEZ_CONF:$TEZ_JARS:$TEZ_LIB' >> $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
