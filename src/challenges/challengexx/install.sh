#!/bin/bash
cd "$(dirname $0)"
# challengexx installation script
## Add the user challengexx to system and give it a password
sudo adduser challengexx --disabled-login --gecos "" 
echo challengexx:challengexx | sudo chpasswd
## Copy the todo.txt file to the /home/challengexx/ and make user and group challengexx the owner of it. Also set the right permissions
sudo cp todo.txt /home/challengexx/.todo.txt
sudo chown challengexx:challengexx /home/challengexx/.todo.txt
sudo chmod 775 /home/challengexx/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challengexx/
sudo cp handler.sh /srv/hackerman/challengexx/handler.sh
sudo chown hackerman:root /srv/hackerman/challengexx/handler.sh
sudo chmod 770 /srv/hackerman/challengexx/handler.sh
## Below is the challenge itself