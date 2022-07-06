FROM ubuntu:20.04

# Create a system user, a trusted network and other variables
ENV MYUSER jadams 
ENV MYPASS mypassword
ENV TRUSTED_NETWORK 10.128.1.0/24
ENV HOSTNAME devops.lab
ENV DEBIAN_FRONTEND noninteractive

# Install the debconf utilities, and in copy the pre-configured files
RUN apt update && apt install -y debconf-utils openssl

RUN useradd -rm -d /home/${MYUSER} -s /bin/bash \
	-p "$(openssl passwd -1 ${MYPASS})" ${MYUSER} 

WORKDIR /usr/src/app
COPY postfix-debconf ./ 

RUN sed -i "s|TRUSTED_NETWORK|${TRUSTED_NETWORK}|g" postfix-debconf
RUN sed -i "s|HOSTNAME|${HOSTNAME}|g" postfix-debconf

RUN debconf-set-selections postfix-debconf

# Install Postfix
RUN apt install -y postfix 

EXPOSE 25 

CMD [ "/usr/sbin/postfix","start-fg"]
