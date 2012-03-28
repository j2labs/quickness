#!/bin/sh

###
### Settings
###

ZMQ_VERSION="zeromq-2.1.11"
PREV_DIR=$PWD
QUICKNESS_DIR=$HOME/.quickness
SRC_DIR=$QUICKNESS_DIR/src


###
### Directory Structures
###

if [ ! -d $SRC_DIR ]; then
    mkdir -p $SRC_DIR 
fi


###
### System Depenencies
###

apt-get -y install \
    libsqlite3-dev \
    sqlite3 \
    libevent-dev \
    libev4


###
### ZeroMQ
###

cd $SRC_DIR

if [ ! -d $ZMQ_VERSION ]; then
    wget http://download.zeromq.org/$ZMQ_VERSION.tar.gz 
    tar zxf $ZMQ_VERSION.tar.gz
    cd $ZMQ_VERSION
    ./autogen.sh
    ./configure && make && make install
fi

ldconfig # update library cache
