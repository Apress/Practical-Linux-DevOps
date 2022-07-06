#!/bin/bash

echo "${DOCKER_HOST}   ${MAIL_HOST}" >> /etc/hosts
echo "${MAIL_HOST}" > /etc/hostname
exec /usr/sbin/apache2 -D FOREGROUND
