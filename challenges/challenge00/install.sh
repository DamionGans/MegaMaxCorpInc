#!/bin/bash
directoryFrom="$(pwd)"
cd $(dirname "$0")
adduser challenge00 --disabled-login --gecos ""
echo challenge00:challenge00 |  chpasswd
cp todo.txt /home/challenge00/todo.txt
chown challenge00:hackerman /home/challenge00/todo.txt
chmod 775 /home/challenge00/todo.txt
cp supersecret /home/challenge00/.supersecret
chown challenge00:hackerman /home/challenge00/.supersecret
chmod 770 /home/challenge00/.supersecret
echo "00.installed" > /srv/hackerman/socket
cd $directoryFrom