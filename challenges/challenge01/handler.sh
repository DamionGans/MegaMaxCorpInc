#!/bin/bash
command=$1
cd $(pwd)/$(dirname "$0")

if [[ "$command" == "install"]]
then
    bash install.sh
fi
if [[ "$command" == "installed"]]
then
    echo "01.installed" > /srv/hackerman/state
fi
if [[ "$command" == "completed" ]]
then
    echo "01.completed" > /srv/hackerman/state
    echo "02.start" >> /srv/hackerman/socket
fi