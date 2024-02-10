FROM php:7.3-apache

RUN a2enmod rewrite
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
       unzip \
        make \
        wget

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
RUN chmod +rx /usr/src/app/web \
    && chmod +rx /usr/src/app \
    && chmod -R +r /usr/src/app/web \
    && chown -R www-data:www-data /usr/src/app/web
WORKDIR /usr/src/app
RUN make

#COPY modify_vhost.sh /usr/local/bin/modify_vhost.sh

#RUN chmod +x /usr/local/bin/modify_vhost.sh
#CMD ["modify_vhost.sh"]


RUN service apache2 restart

EXPOSE 80