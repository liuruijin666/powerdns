FROM centos:7.9.2009
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8
COPY ./rpm /rpm
COPY ./healthcheck.sh /healthcheck.sh
RUN yum install -y /rpm/* > /dev/null && chmod 755 /etc/pdns/pdns.conf && yum clean all && rm -rf /etc/yum.repos.d/* && rm -rf /rpm && systemctl enable pdns && chmod +x /healthcheck.sh
HEALTHCHECK --start-period=60s  --interval=15s --timeout=5s --retries=3 CMD /bin/bash /healthcheck.sh 
WORKDIR /etc/pdns
EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 8081/tcp
ENTRYPOINT /usr/sbin/init
