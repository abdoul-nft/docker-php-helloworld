FROM ubuntu:20.04
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y curl zip unzip git php libapache2-mod-php
WORKDIR /var/www/html
COPY ./src .
COPY composer.* .
EXPOSE 80