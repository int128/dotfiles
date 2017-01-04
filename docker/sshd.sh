#!/bin/sh -xe

# Add user into docker group
[ -S /var/run/docker.sock ]
docker_group="`stat -c '%g' /var/run/docker.sock`"
[ "$docker_group" -gt 0 ]
usermod -a -G "$docker_group" user
id user

# Set authorized_keys of user
mkdir /home/user/.ssh
echo "$USER_AUTHORIZED_KEY" > /home/user/.ssh/authorized_keys
chown -R user:users /home/user

# Run SSHD
exec /usr/sbin/sshd -D -e
