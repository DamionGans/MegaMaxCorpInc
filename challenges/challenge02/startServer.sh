#!/bin/bash
echo "02.startServer" >> /srv/hackerman/socket
sleep 1.5
while [[ "$(cat /srv/hackerman/state)" != "02.startServer"* ]]; 
do 
    sleep 0.5; 
done
if [[ "$(cat /srv/hackerman/state)" == "02.startServerSucces" ]]
then
    echo "Server succesfully started at port 12345. You can enter now..."
else
    echo "Server started unsuccesful."
fi