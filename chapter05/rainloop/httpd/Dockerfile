FROM ubuntu:20.04 
ENV DOCKER_HOST 10.128.1.6
ENV MAIL_HOST docker.devops.lab
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y apache2 \
    php7.2 \
    libapache2-mod-php7.2 \
    php7.2-common \
    php7.2-curl \
    php7.2-xml \
    php7.2-mysql \
    php-date \
    php7.2-fpm \
    php7.2-json \
    php7.2-cli 

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

WORKDIR /usr/src/app
COPY entry.sh ..

CMD ["bash", "entry.sh"]
