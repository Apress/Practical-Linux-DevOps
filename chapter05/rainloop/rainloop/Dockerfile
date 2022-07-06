FROM ubuntu:20.04 

RUN apt update && apt install -y wget unzip

RUN wget https://www.rainloop.net/repository/webmail/rainloop-community-latest.zip

RUN mkdir -p /var/www/html/rainloop

RUN unzip rainloop-community-latest.zip -d /var/www/html/rainloop && \
    chown -R www-data:www-data /var/www/html/rainloop/ && \ 
    find /var/www/html/rainloop/ -type d -exec chmod 750 {} \; && \
    find /var/www/html/rainloop/ -type f -exec chmod 640 {} \;

CMD tail -f /dev/null
