#!/bin/bash
directoryFrom="$(pwd)"
cd $(dirname "$0")
mkdir /srv/intranet
cp -r app/* /srv/intranet/.
cd /srv/intranet
npm install
cd $directoryFrom/$(dirname "$0")
ufw allow 80/tcp
cp intranet.service /etc/systemd/system/.
cd $directoryFrom