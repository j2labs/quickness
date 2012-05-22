#!/usr/bin/env python

import argparse
import sys

import boto


aparser = argparse.ArgumentParser(description='Return the public_dns of one of your instances.')
aparser.add_argument('name', metavar='name', type=str,
                     help='Name of the quickness machine')
args = aparser.parse_args()


conn = boto.connect_ec2()

# Make sure quickness name is going to be unique
instances = conn.get_all_instances()
for res in instances:
    for instance in res.instances:
        if instance.tags.has_key('Quickness'):
            if args.name == instance.tags.get('Quickness'):
                print instance.public_dns_name
                sys.exit()
