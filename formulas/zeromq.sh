#!/bin/sh

###
### Settings
###

ZMQ_VERSION="zeromq-2.1.11"
PREV_DIR=$PWD


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

cd $QUICKNESS_SRC

if [ -d $ZMQ_VERSION ]; then
    rm -rf ./$ZMQ_VERSION
fi

wget http://download.zeromq.org/$ZMQ_VERSION.tar.gz 
tar zxf $ZMQ_VERSION.tar.gz
cd $ZMQ_VERSION
./autogen.sh
./configure && make && make install

ldconfig # update library cache

cd $PREV_DIR
