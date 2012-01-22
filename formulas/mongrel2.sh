#!/bin/sh

### Brubeck installs consist of installing ZeroMQ, Mongrel2 and some Python
### packages. This script currently covers all of this, though it'd be ideal
### to break it apart into more modular components.

###
### Settings
###

MONGREL2_VERSION="mongrel2-1.7.5"
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
    libsqlite3-dev \
    sqlite3 \
    libevent-dev \
    libev4


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

