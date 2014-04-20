FROM ubuntu:precise

MAINTAINER Tim Akinbo <takinbo@timbaobjects.com>

RUN apt-get update
RUN apt-get install -y supervisor openssh-server wget libssl0.9.8 libxml2 psmisc

RUN mkdir -p /var/run/sshd
ADD install_kannel.sh /
RUN /bin/bash /install_kannel.sh
RUN rm /install_kannel.sh
ADD kannel.conf /etc/kannel/kannel.conf
ADD server.conf /etc/supervisor/conf.d/
ADD startup.sh /

EXPOSE 22 13013
ENTRYPOINT ["/bin/bash", "/startup.sh"]
