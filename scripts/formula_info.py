#!/usr/bin/env python

import argparse
import os
import sys
from ConfigParser import SafeConfigParser


aparser = argparse.ArgumentParser(description='Return filename and download url of a formula.')
aparser.add_argument('-o', '--option', metavar='option', dest='option', default='__ALL__',
                           help='Name of the particular option to return')
aparser.add_argument('formula', metavar='formula', type=str,
                     help='Name of the quickness formula')
args = aparser.parse_args()


etc = os.environ['QUICKNESS_ETC']
private = os.environ['QUICKNESS_PRIVATE']
formula_conf = [os.path.join(etc, 'formula.conf'), os.path.join(private, 'formula.conf')]

cparser = SafeConfigParser()
cparser.read(formula_conf)

if not cparser.has_section(args.formula):
    sys.exit()

info = '('

for option in cparser.options(args.formula):
    if args.option == '__ALL__' or args.option == option:
        info += ' ["%s"]="%s"' % (option, cparser.get(args.formula, option))

info += ' )'

print info
