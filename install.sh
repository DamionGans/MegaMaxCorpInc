#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root/sudo"
  exit
fi
originallDir=$(pwd)
cd $(pwd)/$(dirname "$0")

apt-get update
apt-get -y dist-upgrade
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs vsftpd openssh-server
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 |  tee /etc/issue
mkdir /srv/hackerman/
chown -R hackerman:root /srv/hackerman/
chmod 775 /srv/hackerman/
cp -R challenges/challenge00/ /srv/hackerman/
cp -R challenges/challenge01/ /srv/hackerman/
cp -R challenges/challenge02/ /srv/hackerman/
bash services/intranet/install.sh
systemctl enable intranet
systemctl start intranet
bash services/socketreader/install.sh
systemctl enable socketreader
systemctl start socketreader