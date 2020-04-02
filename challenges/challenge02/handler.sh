#!/bin/bash
command=$1
cd $(pwd)/$(dirname "$0")

if [[ "$command" == "install" ]]
then
    bash install.sh
    echo "02.installed" >> /srv/hackerman/socket
fi
if [[ "$command" == "installed" ]]
then
    echo "02. installed" > /srv/hackerman/state
fi

if [[ "$command" == "startServer" ]]
then
    bash startServer-hackerman.sh
fi

if [[ "$command" == "startServerSucces" ]]
then
    echo "02.startServerSucces" > /srv/hackerman/state
fi

if [[ "$command" == "startServerFail" ]]
then
    echo "02.startServerFail" > /srv/hackerman/state
fi

if [[ "$command" == "completed" ]]
then
     echo "02.completed" > /srv/hackerman/state
fi