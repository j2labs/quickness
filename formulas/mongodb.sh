### This script follows the instructions found on MongoDB's website.
### www.mongodb.org/display/DOCS/Ubuntu+and+Debian+packages

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
sudo echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/source.list
sudo apt-get update
sudo apt-get install mongodb-10gen
