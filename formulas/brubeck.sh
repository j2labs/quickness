### Brubeck installs consist of installing ZeroMQ, Mongrel2 and some Python
### packages. This script currently covers all of this, though it'd be ideal
### to break it apart into more modular components.

###
### Settings
###

PREV_DIR=$PWD

###
### Formula Dependencies
###

quick_install zeromq
quick_install mongrel2


###
### System Depenencies
###

apt-get -y install \
    python-dev \
    python-pip \
    libevent-dev \
    libev4


###
### Brubeck
###

cd $QUICKNESS_SRC

if [ -d "brubeck" ]; then
    rm -rf brubeck
fi

git clone https://github.com/j2labs/brubeck.git
cd brubeck

### The next few steps leave a `build/` in the brubeck directory

### Install Brubeck's dependencies
pip install -I -r envs/brubeck.reqs

### Concurrency handled with gevent
pip install gevent

cd build/
git clone https://github.com/traviscline/gevent-zeromq
cd gevent-zeromq
sudo python ./setup.py install
cd ../..


### Install Brubeck itself
python ./setup.py install

cd ../..
