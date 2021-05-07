FROM ubuntu:20.04
LABEL maintainer 'Stefano Cognigni <stefano.cognigni@gruppometa.it>'

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV NODE_VERSION 4.2.4
ENV PATH="/opt/node/bin:${PATH}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    supervisor \
    apache2 \
    imagemagick \
    php7.4-fpm \
    php7.4-bcmath \
    php7.4-cli \
    php7.4-gd \
    php7.4-common \
    php7.4-curl \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-soap \
    php7.4-xml \
    php7.4-iconv \
    php7.4-zip \
    php7.4-sqlite \
    php7.4-xdebug \
    php7.4-dev \
    libmagickwand-dev \
    php-pear \
    curl \
    cron \
    zip \
    unzip \
    git \
    ssh-client \
    locales \
    logrotate \
    wget \
    make \
    bzip2 && \
    pecl install imagick && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod proxy && \
    a2enmod proxy_fcgi && \
    a2enmod setenvif && \
    a2enmod proxy_http && \
    a2enmod deflate && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=1.10.19 && \
    /usr/bin/composer config --global discard-changes true && \
    sed -i "s/pid =.*/pid = \/var\/run\/php-fpm.pid/" /etc/php/7.4/fpm/php-fpm.conf && \
    sed -i "s|;clear_env\s*=\s*no|clear_env = no|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i "s/listen =.*sock/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf && \
    cd /opt && \
    wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz && \
    tar zxvf node-v$NODE_VERSION-linux-x64.tar.gz && \
    rm -rf node-v$NODE_VERSION-linux-x64.tar.gz && \
    mv node-v$NODE_VERSION-linux-x64 node && \
    apt-get remove -y software-properties-common make php7.4-dev libmagickwand-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
COPY apache2.conf /etc/apache2/apache2.conf
COPY run.sh /run.sh
RUN sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    sed -i -e 's#www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin#www-data:x:33:33:www-data:/var/www:/bin/bash#' /etc/passwd && \
    chmod +x /run.sh
ENV LANG it_IT.UTF-8
ENV LANGUAGE it_IT:it
ENV LC_ALL it_IT.UTF-8
COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["/run.sh"]
