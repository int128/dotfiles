FROM centos:7
RUN yum update -y && \
    yum install -y git zsh vim-enhanced sudo && \
    # Restore locale
    yum reinstall -y glibc-common && \
    # Add user and enable sudo
    useradd -g users -G wheel user && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
    chmod 400 /etc/sudoers.d/wheel
COPY . /home/user/dotfiles
RUN chown -R user:users /home/user
USER user
RUN /home/user/dotfiles/install.sh
ENV LANG en_US.UTF-8
CMD ["/bin/zsh", "-l"]
