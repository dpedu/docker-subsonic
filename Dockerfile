FROM ubuntu:bionic

EXPOSE 4050
EXPOSE 4051

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y openjdk-8-jre-headless wget sudo

RUN wget -qO /tmp/subsonic.deb https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-6.1.beta2.deb && \
    dpkg -i /tmp/subsonic.deb && \
    useradd subsonic && \
    mkdir /var/subsonic/lucene2 && \
    chown -R subsonic:subsonic /var/subsonic && \
    mkdir /tools && \
    wget -qO /tools/hsqldb-1.8.0.5.jar http://repo1.maven.org/maven2/hsqldb/hsqldb/1.8.0.5/hsqldb-1.8.0.5.jar && \
    wget -qO /tools/sqltool-2.0.0.jar http://repo1.maven.org/maven2/org/hsqldb/sqltool/2.0.0/sqltool-2.0.0.jar

ADD start /start
ENTRYPOINT ["/start"]

