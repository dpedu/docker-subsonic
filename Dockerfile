FROM ubuntu:trusty

EXPOSE 4050
EXPOSE 4051

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y openjdk-7-jre-headless wget supervisor && \
    wget -O /tmp/subsonic.deb http://subsonic.org/download/subsonic-5.3.deb && \
    dpkg -i /tmp/subsonic.deb && \
    useradd subsonic && \
    chown -R subsonic:subsonic /var/subsonic

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD subsonic.conf   /etc/supervisor/conf.d/subsonic.conf

ENTRYPOINT ["supervisord"]
