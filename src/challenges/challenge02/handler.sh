#!/bin/bash
command=$1
if [[ "$command" == "startServerSucces" ]]
then
    systemctl start vsftpd
    echo "server succefully started" > /srv/hackerman/challenge02/status
fi
if [[ "$command" == "02.startServerFail" ]]
then
    systemctl start vsftpd
    echo "server succefully failed starting" > /srv/hackerman/challenge02/status
fi
