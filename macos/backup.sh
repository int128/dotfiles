#!/bin/sh -x
cd
tar -cvf configuration.tar \
 .ssh \
 .gnupg \
 .viminfo \
 .zhistory \
 .ApacheDirectoryStudio \
 .gradle/gradle.properties \
 Library/Preferences/Tunnelblick/Configurations \
 Library/Preferences/ATOK*/ATOK*.DIC
