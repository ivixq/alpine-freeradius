FROM ivixq/alpine-s6
MAINTAINER ivixq

RUN apk update && apk upgrade && \
    apk add --update freeradius \
        freeradius-sqlite \
        freeradius-lib \
        freeradius-radclient \
        freeradius-mysql \
        pwgen \
        mutt \
        msmtp \
        mariadb-client && \
    rm -rf /var/cache/apk/*

COPY rootfs /

RUN ln -snf /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/ && \
    ln -snf /etc/raddb/sites-available/status /etc/raddb/sites-enabled/ && \
    chgrp radius /usr/sbin/radiusd && chmod g+rwx /usr/sbin/radiusd && \
    chgrp radius /etc/raddb/mods-available/sql && \
    chgrp radius /etc/raddb/sites-available/status

VOLUME [ "/userpass/" ] \
       [ "/scripts/" ]

EXPOSE 1812/udp \
       1813/udp \
       18120 \
       18121
