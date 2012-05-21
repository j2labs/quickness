#!/usr/bin/env python

import argparse
import sys

import boto


aparser = argparse.ArgumentParser(description='Destroy a quickness ec2 instance.')
aparser.add_argument('name', metavar='name', type=str,
                           help='Name of the quickness machine')
args = aparser.parse_args()

conn = boto.connect_ec2()


# Make sure quickness machine exists and if it does give user 1 last chance to save it
instances = conn.get_all_instances()
for res in instances:
    for instance in res.instances:
        if instance.tags.has_key('Quickness'):
            if args.name == instance.tags.get('Quickness'):
                s = raw_input('Are you sure you want to terminate %s (Y/N)? ' % args.name)
                if s == 'Y':
                    print 'Terminating %s' % args.name
                    instance.terminate()
                sys.exit()
