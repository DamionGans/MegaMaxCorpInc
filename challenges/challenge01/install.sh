#!/bin/bash
directoryFrom="$(pwd)"
cd $(dirname "$0")
adduser challenge01 --disabled-login --gecos ""
echo challenge01:challenge01 |  chpasswd
cp todo.txt /home/challenge01/.todo.txt
chown challenge01:hackerman /home/challenge01/.todo.txt
chmod 770 /home/challenge01/.todo.txt
cp completeChallenge01 /bin/.completeChallenge01
chown challenge01:hackerman /bin/.completeChallenge01
chmod +x /bin/.completeChallenge01
cd $directoryFrom