#!/bin/sh

host=$(dmidecode -s system-serial-number)
host=$(echo "UAT-$host" | sed -e "s/[^A-Za-z0-9-]//g")
sed -i -e "s/unassigned-host/$host/g" /target/etc/hostname
sed -i -e "s/unassigned-host/$host/g" /target/etc/hosts
useradd -m -g 100 -s /bin/bash -k /etc/skel/ test
