#!/bin/bash

# https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
sudo chmod -R 755 /usr/local/share/zsh/site-functions
sudo chown -R root:root /usr/local/share/zsh/site-functions

export SHELL=/bin/zsh
xterm &
sleep 3
import -window root screenshot.jpg
