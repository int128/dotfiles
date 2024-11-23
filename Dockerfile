FROM debian:12.8@sha256:10901ccd8d249047f9761845b4594f121edef079cfd8224edebd9ea726f0a7f6

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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
