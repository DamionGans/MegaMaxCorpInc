#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root/sudo"
  exit
fi
cd $(pwd)/$(dirname "$0")
originalDir=$(pwd)

apt-get update
apt-get -y dist-upgrade
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs vsftpd openssh-server
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 |  tee /etc/issue
mkdir /srv/hackerman/
bash services/intranet/install.sh
bash services/socketreader/install.sh
cp -R challenges/challenge00/ /srv/hackerman/
cp -R challenges/challenge01/ /srv/hackerman/
cp -R challenges/challenge02/ /srv/hackerman/
echo "00.install" > /srv/hackerman/socket