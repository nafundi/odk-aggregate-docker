FROM alpine:3.5
MAINTAINER Andrey N. Petrov <andreynpetrov@gmail.com>

ENV GOSU_VERSION="1.7" \
	GOSU_DOWNLOAD_URL="https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
	GOSU_DOWNLOAD_SIG="https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" \
	GOSU_DOWNLOAD_KEY="0x036A9C25BF357DD4"

RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		curl \
		gnupg \
	&& gpg-agent --daemon \
	&& gpg --keyserver pgp.mit.edu --recv-keys $GOSU_DOWNLOAD_KEY \
	&& echo "trusted-key $GOSU_DOWNLOAD_KEY" >> /root/.gnupg/gpg.conf \
	&& curl -sSL "$GOSU_DOWNLOAD_URL" > gosu-amd64 \
	&& curl -sSL "$GOSU_DOWNLOAD_SIG" > gosu-amd64.asc \
	&& gpg --verify gosu-amd64.asc \
	&& rm -f gosu-amd64.asc \
	&& mv gosu-amd64 /usr/bin/gosu \
	&& chmod +x /usr/bin/gosu \
    && apk del .build-deps \
	&& rm -rf /root/.gnupg \
    && addgroup -S mysql \
    && adduser -S -G mysql mysql \
    && apk --no-cache --update add \
         mariadb \
         mariadb-client \
         tzdata \
         pwgen \
         bash \
    && mkdir /docker-entrypoint-initdb.d \ 
    && rm -f /var/cache/apk/* \
    # purge and re-create /var/lib/mysql with appropriate ownership
	&& rm -rf /var/lib/mysql \
    && mkdir -p /var/lib/mysql /var/run/mysqld /etc/mysql/conf.d \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /etc/mysql/conf.d \
	&& chmod 777 /var/run/mysqld

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/
COPY my.cnf /etc/mysql/my.cnf
COPY create_db_and_user.sql /docker-entrypoint-initdb.d/create_db_and_user.sql

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]





