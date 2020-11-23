FROM alpine:3.12

RUN apk add --no-cache \
      bash \
      rsync \
      rsyslog \
      rsyslog-tls \
      logrotate \
      tzdata \
      supervisor \
      dcron

COPY ./logrotate /usr/local/bin
COPY ./rsyslog /etc/logrotate.d
COPY ./logrotate.conf /etc/

COPY ./rsyslog.conf /etc/
COPY ./01_omfile.conf /etc/rsyslog.d/
COPY ./10_imudp.conf  /etc/rsyslog.d/
COPY ./10_imtcp.conf  /etc/rsyslog.d/

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

############################################################################################
#
# docker-extensions
#
RUN mkdir -p  /usr/local/bin
COPY ./bin/*  /usr/local/bin
COPY ./boot.d /boot.d
RUN chmod -R a+x /boot.d /usr/local/bin
############################################################################################


EXPOSE 514/tcp
EXPOSE 514/udp

#
# startup script
#
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/start.sh"]

