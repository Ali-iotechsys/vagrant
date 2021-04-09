#!/bin/sh

rc-status
touch /run/openrc/softlevel
rc-service sshd start
rc-service docker start
cd /
sleep 30
rc-status
#docker load -i nodeImages.tar
tail -f /dev/null
