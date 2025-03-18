FROM debian:12.10@sha256:18023f131f52fc3ea21973cabffe0b216c60b417fd2478e94d9d59981ebba6af

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    zsh \
    locales \
    git \
    curl \
    dnsutils \
    vim

# fix error zsh: character not in range
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen

ENV HOME=/root
COPY . /root/dotfiles
RUN /root/dotfiles/install

WORKDIR /root
CMD ["/bin/zsh", "-l"]
