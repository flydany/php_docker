FROM php:5.6-fpm


# COPY ./extensions /usr/local/etc/php/extensions
COPY ./extensions /usr/local/lib/php/extensions


RUN echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian-security buster/updates main \n \
    deb-src http://mirrors.aliyun.com/debian-security buster/updates main \n \
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
        build-essential \
        libmagickcore-dev \
        libmagickwand-dev \
        imagemagick \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) gd iconv pdo_mysql \
    && pecl install redis-2.2.5 \
    && pecl install imagick \
    && pecl install mcrypt \
    && docker-php-ext-enable redis imagick mcrypt
