#!/bin/sh

### Brubeck installs consist of installing ZeroMQ, Mongrel2 and some Python
### packages. This script currently covers all of this, though it'd be ideal
### to break it apart into more modular components.

###
### Settings
###

PREV_DIR=$PWD
QUICKNESS_DIR=$HOME/.quickness
SRC_DIR=$QUICKNESS_DIR/src


###
### Directory Structures
###

if [ ! -d $SRC_DIR ]; then
    mkdir $SRC_DIR 
fi


###
### System Depenencies
###

apt-get -y install \
    python-dev \
    python-pip \
    libevent-dev \
    libev4


###
### Formula Dependencies
###

./zeromq.sh
./mongrel2.sh


###
### Brubeck
###

cd $SRC_DIR

if [ -d "brubeck" ]; then
    rm -rf brubeck
fi

git clone https://github.com/j2labs/brubeck.git
cd brubeck

### Install Brubeck's dependencies
pip install -I -r envs/brubeck.reqs

### Concurrency already handled with gevent + zeromq
pip install -I -r envs/gevent.reqs

### Install Brubeck itself
python ./setup.py install

cd ../..
