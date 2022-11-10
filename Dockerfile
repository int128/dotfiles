FROM debian:11

RUN apt-get update && apt-get install -y zsh git curl vim

ENV HOME /root
COPY . /root/dotfiles
RUN /root/dotfiles/install

WORKDIR /root
CMD ["/bin/zsh", "-l"]
