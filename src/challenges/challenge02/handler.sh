#!/bin/bash
command=$1
if [[ "$command" == "startServer" ]]
then
    bash /srv/hackerman/challenge02/startServer-hackerman.sh
fi
if [[ "$command" == "startServerSucces" ]]
then
    systemctl start vsftpd
    echo "02.startServerSucces" > /srv/hackerman/challenge02/status
fi
if [[ "$command" == "startServerFail" ]]
then
    systemctl stop vsftpd
    echo "02.startServerFail > /srv/hackerman/challenge02/status
fi
