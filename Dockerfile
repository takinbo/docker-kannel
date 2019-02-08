FROM ubuntu:precise

MAINTAINER Tim Akinbo <takinbo@timbaobjects.com>

RUN apt-get update && apt-get install -y \
    bison \
    build-essential \
    libxml2-dev \
    libssl-dev \
    openssl \
    wget \
    && wget --no-check-certificate https://kannel.org/download/1.4.5/gateway-1.4.5.tar.gz \
    && tar xzf gateway-1.4.5.tar.gz \
    && cd gateway-1.4.5 \
    && ./configure --prefix=/usr --sysconfdir=/etc/kannel \
    && touch .depend \
    && make \
    && make install \
    && cp test/fakesmsc /usr/sbin/ \
    && cp test/fakewap /usr/sbin/ \
    && cd / \
    && rm gateway-1.4.5.tar.gz \
    && rm -Rf gateway-1.4.5 \
    && mkdir -p /var/log/kannel \
    && mkdir -p /var/spool/kannel

VOLUME /etc/kannel
VOLUME /var/log/kannel
VOLUME /var/spool/kannel
WORKDIR /usr/sbin
