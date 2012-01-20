### Set up open file descriptor limits
echo "fs.file-max = 1000000" >> /etc/sysctl.conf
echo "ubuntu	soft	nofile	1000000" >> /etc/security/limits.conf
echo "ubuntu	hard	nofile	1000000" >> /etc/security/limits.conf

### Disable NUMA: http://www.mongodb.org/display/DOCS/NUMA
echo 0 > /proc/sys/vm/zone_reclaim_mode

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
