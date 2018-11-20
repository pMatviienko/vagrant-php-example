FROM debian:stretch
MAINTAINER Pavel Matviienko <shturman.p@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl wget apt-transport-https lsb-release ca-certificates git openssh-client mysql-client mc \
    htop unzip lsof inetutils-tools inetutils-ping \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install --no-install-recommends -y \
    php7.2 php7.2-fpm php7.2-dev php7.2-bcmath php7.2-json php7.2-sqlite3 php7.2-opcache \
    php7.2-curl php7.2-cli php7.2-intl php7.2-xml php7.2-zip php7.2-mysql php7.2-mbstring \
    php7.2-gd php7.2-amqp php7.2-igbinary php7.2-apcu

RUN sed -i 's/post_max_size = 8M/post_max_size = 200M/' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 2048M/' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/max_file_uploads = 20/max_file_uploads = 200/' /etc/php/7.2/fpm/php.ini

ADD ./docker/php-fpm-pool.conf /etc/php/7.2/fpm/pool.d/php-fpm.conf
ADD ./ /webapp

RUN service php7.2-fpm stop && update-rc.d -f php7.2-fpm disable\
    && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
    && unlink /etc/php/7.2/fpm/pool.d/www.conf \
    && mkdir /run/php/ && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /webapp
VOLUME /webapp

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7.2", "-F", "-R"]