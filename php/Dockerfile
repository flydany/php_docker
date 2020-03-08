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
RUN apt-get update && apt-get install --allow-downgrades -y  zlib1g=1:1.2.8.dfsg-5 \
        zlib1g-dev \
        libbz2-1.0 \
        libwebp-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
    # 安装扩展
    # && docker-php-source extract \
    # && docker-php-ext-install -j$(nproc) redis bcmath iconv mbstring mysqli \
    # && cd /usr/src/php/ext/gd \
    # && docker-php-ext-configure gd --with-webp-dir=/usr/include/webp --with-jpeg-dir=/usr/include --with-png-dir=/usr/include --with-freetype-dir=/usr/include/freetype2 \
    # && docker-php-ext-install -j$(nproc) gd \
    # 删除安装包？
    && rm -rf /var/lib/apt/lists/*

# 对其他容器开放9000端口
EXPOSE 9000