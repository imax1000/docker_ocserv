# Use an official rockylinux
FROM rockylinux:8

MAINTAINER imax1000 <MaximIzvekov@yandex.ru>

ARG VERSION
ARG NAME

LABEL Description="This image is used to start OpenConnect VPN Server" Version=${VERSION} Name=${NAME}

ENV LISTEN_PORT	443
ENV HOSTNAME 	ihomevpn.sytes.net


RUN yum install -y epel-release && \
    yum install -y ocserv iptables iperf

VOLUME /etc/ocserv/ocserv.conf
VOLUME /etc/ocserv/config-per-user/
VOLUME /etc/ocserv/ocpasswd

WORKDIR /etc/ocserv

COPY ${PWD}/entrypoint.sh /entrypoint.sh

EXPOSE $LISTEN_PORT/tcp
EXPOSE $LISTEN_PORT/udp

CMD ["ocserv", "-c", "/etc/ocserv/ocserv.conf", "-f", "-d", "3"]

#ENTRYPOINT ["/entrypoint.sh"]
