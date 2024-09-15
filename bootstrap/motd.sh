#!/usr/bin/env bash

# remove motd
rm -f /etc/update-motd.d/99-bento
run-parts /etc/update-motd.d > /dev/null
touch /home/vagrant/.hushlogin

