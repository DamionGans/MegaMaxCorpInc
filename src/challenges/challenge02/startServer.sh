#!/bin/bash
echo "02.startServer" >> /srv/hackerman/socket
sleep 1.5
while [[ ! -f /srv/hackerman/.S€CRET/status ]]; 
do 
    sleep 0.5; 
done

cat /srv/hackerman/.S€CRET/status