FROM ubuntu:20.04

# Create a system user
ENV MYUSER jadams
ENV MYPASS mypassword
ENV DOCKER_HOST 10.128.1.6
ENV DEBIAN_FRONTEND noninteractive

# Install openssl
RUN apt update && apt install -y openssl

RUN useradd -rm -d /home/${MYUSER} -s /bin/bash \
	-p "$(openssl passwd -1 ${MYPASS})" ${MYUSER} 

RUN mkdir -p /home/${MYUSER}/mail/INBOX && \
	touch /home/${MYUSER}/mail/Sent && \
	chown ${MYUSER}:${MYUSER} /home/${MYUSER}/mail -R

# Install Dovecot 
RUN apt install -y dovecot-core dovecot-imapd dovecot-pop3d

EXPOSE 143

CMD [ "/usr/sbin/dovecot","-F"]
