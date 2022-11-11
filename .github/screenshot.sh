#!/bin/bash
set -eux

xrdb ~/.Xdefaults

#export SHELL=/bin/zsh
xterm &
sleep 3
import -window root screenshot.jpg
