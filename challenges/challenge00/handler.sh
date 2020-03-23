#!/bin/bash
command=$1

if [[ "$command" == "installed" ]]
then
    echo "00.installed" > /srv/hackerman/state
    systemctl stop sshd
fi
if [[ "$command" == "hacked" ]]
then
    echo "00.hacked" > /srv/hackerman/state
    systemctl start sshd

fi
if [[ "command" == "completed "]]
then
    echo "00.completed" > /srv/hackerman/state
    echo "01.start" >> /srv/hackerman/socket
fi