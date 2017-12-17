#!/bin/sh -x
cd
tar -cvf configuration.tar \
 .ssh \
 .aws \
 .ecs \
 .kube/config \
 .serverlessrc \
 .gnupg \
 .viminfo \
 .zhistory \
 .gradle/gradle.properties \
 Library/Preferences/ATOK*/ATOK*.DIC
