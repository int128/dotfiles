FROM centos:7

RUN yum update -y && \
    # Install packages
    yum install -y git zsh vim-enhanced sudo man-pages && \
    # Install Docker Compose
    curl -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64 && \
    chmod +x /usr/local/bin/docker-compose && \
    # Restore locale
    yum reinstall -y glibc-common && \
    localedef -c -i en_US -f UTF-8 en_US.UTF-8 && \
    echo 'LANG=en_US.UTF-8' >> /etc/profile.d/locale.sh && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/profile.d/locale.sh && \
    # Add user
    useradd -g users -G wheel -s /bin/zsh user && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
    chmod 400 /etc/sudoers.d/wheel && \
    true

# Install dotfiles
COPY . /home/user/dotfiles
RUN chown -R user:users /home/user
USER user
RUN /home/user/dotfiles/install.sh
CMD ["zsh", "-l"]
