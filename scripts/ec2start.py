#!/usr/bin/env python

import argparse
import sys

import boto


aparser = argparse.ArgumentParser(description='Start a quickness ec2 instance.')
aparser.add_argument('name', metavar='name', type=str,
                           help='Name of the quickness machine')
args = aparser.parse_args()

conn = boto.connect_ec2()


# Make sure quickness machine exists and if it does start it
instances = conn.get_all_instances()
for res in instances:
    for instance in res.instances:
        if instance.tags.has_key('Quickness'):
            if args.name == instance.tags.get('Quickness'):
                print 'Starting %s' % args.name
                instance.start()
                sys.exit()
