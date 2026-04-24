FROM debian:13.4-slim@sha256:cedb1ef40439206b673ee8b33a46a03a0c9fa90bf3732f54704f99cb061d2c5a

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    zsh \
    locales \
    sudo \
    git \
    curl \
    dnsutils \
    vim

# Fix error zsh: character not in range
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen

RUN useradd -m --shell /bin/zsh --uid 1000 int128 && \
    echo 'int128 ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/int128
USER int128
WORKDIR /home/int128
COPY --chown=1000:1000 . dotfiles
RUN ./dotfiles/install

CMD ["/bin/zsh", "-l"]
