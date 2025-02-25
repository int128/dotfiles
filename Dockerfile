FROM debian:12.9@sha256:35286826a88dc879b4f438b645ba574a55a14187b483d09213a024dc0c0a64ed

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
