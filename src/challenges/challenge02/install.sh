#!/bin/bash
# challenge02 installation script
## Add the user challenge02 to system and give it a password
sudo adduser challenge02 --disabled-login --gecos "" 
echo challenge02:challenge02 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge02/ and make user and group challenge02 the owner of it. Also set the right permissions
sudo cp ./todo.txt /home/challenge02/.todo.txt
sudo chown challenge00:challenge00 /home/challenge00/.todo.txt
sudo chmod 775 /home/challenge02/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge02/
sudo cp handler.sh /srv/hackerman/challenge02/handler.sh
sudo chown hackerman:root /srv/hackerman/challenge02/handler.sh
sudo chmod 770 /srv/hackerman/challenge02/handler.sh
## Create the Secret webserver config and startup files
sudo mkdir /srv/.S€CRE]/
sudo cp -R ./app/ /srv/.S€CRE]/
sudo cp ./config /srv/.S€CRE]/
sudo cp ./startServer.sh /srv/.S€CRE]/
sudo chmod 770 /srv/.S€CRE]/startServer.sh
sudo chown challenge02:hackerman /srv/.S€CRE]/startServer.sh
sudo mkdir /srv/hackerman/challenge02/
sudo cp ./startServer-hackerman.sh /srv/hackerman/challenge02/
sudo chmod 770 /srv/hackerman/challenge02/startServer-hackerman.sh
sudo chown hackerman:root /srv/hackerman/challenge02/startServer-hackerman.sh