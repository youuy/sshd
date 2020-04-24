FROM ubuntu:16.04
RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/* /tmp/*
RUN mkdir /var/run/sshd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
ENV AUTHORIZED_KEYS=
RUN passwd -d root
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/authorized_keys
EXPOSE 22
CMD sh -c "echo $AUTHORIZED_KEYS > /root/.ssh/authorized_keys && /usr/sbin/sshd -D"