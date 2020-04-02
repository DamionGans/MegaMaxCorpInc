#!/bin/bash
directoryFrom="$(pwd)"
cd $(dirname "$0")

touch /srv/hackerman/socket
chmod 777 /srv/hackerman/socket
touch /srv/hackerman/state
chown hackerman:root /srv/hackerman/state
chmod 774 /srv/hackerman/state
cp socketreader /srv/hackerman/socketreader
cp socketreader.service /etc/systemd/system/.
cd $directoryFrom