#!/bin/sh

### Brubeck installs consist of installing ZeroMQ, Mongrel2 and some Python
### packages. This script currently covers all of this, though it'd be ideal
### to break it apart into more modular components.

###
### Settings
###

ZMQ_VERSION="zeromq-2.1.9"
MONGREL2_VERSION="mongrel2-1.7.5"
PREV_DIR=$PWD
SRC_DIR=$HOME/src


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
    libsqlite3-dev \
    sqlite3 \
    libevent-dev \
    libev4


###
### ZeroMQ
###

cd $SRC_DIR

if [ ! -d $ZMQ_VERSION ]; then
    wget http://download.zeromq.org/historic/$ZMQ_VERSION.tar.gz 
    tar zxf $ZMQ_VERSION.tar.gz
    cd $ZMQ_VERSION
    ./autogen.sh
    ./configure && make && make install
fi

ldconfig # update library cache


###
### Mongrel2
###

cd $SRC_DIR
if [ ! -d $MONGREL2_VERSION ]; then
    wget http://mongrel2.org/static/downloads/$MONGREL2_VERSION.tar.bz2
    tar jxf $MONGREL2_VERSION.tar.bz2
    cd $MONGREL2_VERSION
    make && make install
fi


###
### Brubeck
###

cd $SRC_DIR
if [ ! -d "brubeck" ]; then
    git clone https://github.com/j2labs/brubeck.git
    cd brubeck

    ### Install Brubeck's dependencies
    pip install -I -r envs/brubeck.reqs

    ### Concurrency already handled with gevent + zeromq
    pip install -I -r envs/gevent.reqs

    ### Install Brubeck itself
    python ./setup.py install
    cd ../..
fi
