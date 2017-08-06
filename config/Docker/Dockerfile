# Dockerfile
FROM tutum/apache-php
RUN apt-get update && apt-get install -yq git php5-mcrypt && rm -rf /var/lib/apt/lists/*

RUN php5enmod mcrypt

RUN rm -fr /app
ADD . /app
RUN rm /var/www/html
RUN ln -s /app/public /var/www/html

RUN composer install

EXPOSE 80