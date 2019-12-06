#!/bin/sh
ssh-keygen -f ~/.ssh/known_hosts -R [`vagrant ssh-config|grep "HostName" |awk '{ print $2 }'`]:`vagrant ssh-config|grep Port|awk '{ print $2 }'`
vagrant destroy -f
rm -rf sbcl
