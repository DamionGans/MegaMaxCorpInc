#!/bin/bash
command=$1
cd $(pwd)/$(dirname "$0")

if [["$command" == "install" ]]
then
    bash install.sh
if [[ "$command" == "installed" ]]
then
    echo "02. installed" > /srv/hackerman/state
fi

if [[ "$command" == "startServer" ]]
then
    bash /srv/hackerman/challenge02/startServer-hackerman.sh
fi

if [[ "$command" == "startServerSucces" ]]
then
    systemctl start vsftpd
    echo "02.startServerSucces" > /srv/hackerman/state
fi

if [[ "$command" == "startServerFail" ]]
then
    systemctl stop vsftpd
    echo "02.startServerFail" > /srv/hackerman/state
fi

if [[ "$command" == "completed" ]]
then
     echo "02.completed" > /srv/hackerman/state
fi