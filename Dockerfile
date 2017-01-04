FROM centos:7

RUN yum update -y && \
    # Install packages
    yum install -y cifs-utils openssh-server git zsh vim-enhanced sudo && \
    # Install Docker Compose
    curl -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64 && \
    chmod +x /usr/local/bin/docker-compose && \
    # Restore locale
    yum reinstall -y glibc-common && \
    localedef -c -i en_US -f UTF-8 en_US.UTF-8 && \
    true

RUN useradd -g users -G wheel -s /bin/zsh user && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
    chmod 400 /etc/sudoers.d/wheel && \
    # Locale default
    echo 'LANG=en_US.UTF-8' >> /etc/profile.d/locale.sh && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/profile.d/locale.sh && \
    # Configure SSHD
    mkdir /var/run/sshd && \
    sed 's/session\s*required\s*pam_loginuid.so/session optional pam_loginuid.so/g' -i /etc/pam.d/sshd && \
    ssh-keygen -A && \
    true

# Install dotfiles
COPY . /home/user/dotfiles
RUN find /home/user/dotfiles -type f | xargs chmod 644 && \
    find /home/user/dotfiles -type d | xargs chmod 755 && \
    chmod +x /home/user/dotfiles/install.sh && \
    HOME=/home/user /home/user/dotfiles/install.sh

EXPOSE 22
COPY docker/sshd.sh /
RUN chmod +x /sshd.sh
CMD ["/sshd.sh"]
