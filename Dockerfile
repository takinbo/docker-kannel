FROM ubuntu:precise

MAINTAINER Tim Akinbo <takinbo@timbaobjects.com>

RUN apt-get update && apt-get install -y \
    bison \
    build-essential \
    libxml2-dev
ADD http://kannel.org/download/1.4.4/gateway-1.4.4.tar.gz gateway-1.4.4.tar.gz
RUN tar xzf gateway-1.4.4.tar.gz
WORKDIR gateway-1.4.4
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel
RUN touch .depend
RUN make
RUN make install
WORKDIR /
RUN rm gateway-1.4.4.tar.gz
RUN rm -Rf gateway-1.4.4
RUN mkdir -p /var/log/kannel
RUN mkdir -p /var/spool/kannel

VOLUME /etc/kannel
VOLUME /var/log/kannel
VOLUME /var/spool/kannel
WORKDIR /usr/sbin
