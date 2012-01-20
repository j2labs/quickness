### Update package manager
apt-get update

### Update packages
apt-get -y upgrade

### Install universal needs
apt-get -y install \
    build-essential \
    autoconf \
    automake \
    libtool \
    uuid-dev \
    git-core \
    mercurial

ldconfig

mkdir $HOME/src
