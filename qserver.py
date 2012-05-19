#!/usr/bin/env python

import boto
import sys
import time

try:
    import ec2_private
except:
    print "Create an ec2.private.py (refer to ec2.sample.py)"
    sys.exit()

conn = boto.connect_ec2()

image = conn.get_image('ami-a29943cb')

profile_text = """
### Quickness
. \$HOME/.quickness_repo/etc/profile"""

custom_user_data = """#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy upgrade
sudo apt-get install -y \
    autoconf \
    automake \
    build-essential \
    git \
    ntp

if [ -d /home/ubuntu ]; then
    su -l -c "git clone git://github.com/jserver/quickness.git .quickness_repo" ubuntu
    su -l -c "echo '%s' >> .profile" ubuntu
fi

cp /home/ubuntu/.quickness_repo/etc/motd.tail /etc/motd.tail
""" % profile_text

# placement, user_data,
reservation = image.run(key_name=ec2_private.KEY_NAME,
                        instance_type=ec2_private.INSTANCE_TYPE,
                        placement=ec2_private.PLACEMENT,
                        security_group_ids=ec2_private.SECURITY_GROUP_IDS,
                        user_data=custom_user_data)
instance = reservation.instances[0]

print "Checking every 10 seconds"
while True:
    time.sleep(10)
    status = instance.update()
    if status == 'running':
        break
    else:
        print status

print instance.id
print instance.public_dns_name
