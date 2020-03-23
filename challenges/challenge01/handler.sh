#!/bin/bash
command=$1
if [[ "$command" == "start" ]]
then

fi
if [[ "$command" == "completeChallenge01" ]]
then
    echo "01.completeChallenge01" > /srv/hackerman/state
fi
if [[ "$command" == "completed" ]]
then
    echo "01.completed" > /srv/hackerman/state
    echo "02.start" >> /srv/hackerman/socket
fi