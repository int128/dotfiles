FROM debian:11

# set the locale as https://hub.docker.com/_/debian/
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get install -y zsh git curl vim

ENV HOME /root
COPY . /root/dotfiles
RUN /root/dotfiles/install

WORKDIR /root
CMD ["/bin/zsh", "-l"]
