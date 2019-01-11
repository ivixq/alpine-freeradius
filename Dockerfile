FROM ivixq/alpine-s6
MAINTAINER ivixq

RUN apk --no-cache upgrade && \
    apk --no-cache add \
        freeradius \
        freeradius-sqlite \
        freeradius-lib \
        freeradius-radclient \
        freeradius-mysql \
        pwgen \
        mariadb-client \
        && \
    rm -rf /var/cache/apk/*

COPY rootfs /

RUN ln -snf /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/ && \
    ln -snf /etc/raddb/sites-available/status /etc/raddb/sites-enabled/ && \
    chgrp radius /usr/sbin/radiusd && chmod g+rwx /usr/sbin/radiusd && \
    chgrp radius /etc/raddb/mods-available/sql && \
    chgrp radius /etc/raddb/sites-available/status

VOLUME ["/userpass/"] 

EXPOSE 1812/udp 1813/udp
