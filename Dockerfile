FROM debian:wheezy
MAINTAINER k.keppens@ugent.be

ENV WOWZA_VERSION=4.7.1

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget supervisor openjdk-7-jre expect rubygems ruby1.9.3 \
 && rm -rf /var/lib/apt/lists/*

RUN gem install fpm

COPY prepare.sh interaction.exp /app/
RUN /app/prepare.sh

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

COPY packaging /packaging

VOLUME ["/packaging"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
