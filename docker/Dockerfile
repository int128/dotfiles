FROM int128/dotfiles:latest

RUN yum install -y openssh-server cifs-utils && \
    mkdir /var/run/sshd && \
    sed 's/session\s*required\s*pam_loginuid.so/session optional pam_loginuid.so/g' -i /etc/pam.d/sshd && \
    ssh-keygen -A && \
    true

USER root
EXPOSE 22
COPY sshd.sh /
RUN chmod +x /sshd.sh
CMD ["/sshd.sh"]
