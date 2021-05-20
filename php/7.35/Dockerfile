FROM php:7.3.5-fpm

LABEL maintainer="flydany@yeah.net"

COPY ./php.ini /usr/local/etc/php/php.ini
# COPY ./extensions /usr/local/etc/php/extensions
COPY ./extensions /usr/local/lib/php/extensions/no-debug-non-zts-20180731

# 修改镜像源
RUN echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/*
    
# 安装依赖,核心扩展,pecl扩展,git,composer,npm工具
# 相关依赖必须手动安装
# RUN apt-get update && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    # && apt-get update && apt-get install -y zlib1g=1:1.2.8.dfsg-5 zlib1g-dev libbz2-1.0 libzip-dev libwebp-dev \
RUN apt-get update && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev \
    && apt-get update && apt-get install -y zlib1g-dev libzip-dev \
    # 安装扩展
    && docker-php-source extract \
    # && docker-php-ext-install -j$(nproc) bcmath zip iconv mbstring mysqli pdo pdo_mysql \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir --enable-gd-native-ttf \
    && docker-php-ext-install -j$(nproc) gd \
    # 删除安装包？
    && docker-php-source delete \
    && rm -rf /var/lib/apt/sources.lists/*

# 对其他容器开放9000端口
EXPOSE 9000