FROM alpine

RUN apk add --update curl && \
    apk add openjdk8-jre-base && \
    apk add bash && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin


# SPARK
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
RUN curl -s $SPARK_ARCHIVE | tar -xz -C /usr/local/ && rm -rf /usr/local/spark-2.2.0-bin-hadoop2.7.tgz

ENV SPARK_HOME /usr/local/spark-2.2.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin

EXPOSE 4040 6066 7077 8080

WORKDIR $SPARK_HOME
