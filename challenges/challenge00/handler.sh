#!/bin/bash
command=$1

cd $(pwd)/$(dirname "$0")

if [[ "$command" == "install" ]]
then
    bash install.sh
    echo "00.installed" >> /srv/hackerman/socket
fi

if [[ "$command" == "installed" ]]
then
    echo "00.installed" > /srv/hackerman/state
fi

if [[ "$command" == "completed" ]]
then
    echo "01.install" >> /srv/hackerman/socket
fi