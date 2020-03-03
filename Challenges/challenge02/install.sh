#!/bin/bash
## Add the user challenge01 to system and give it a password
sudo adduser challenge02 --disabled-login --gecos "" 
echo challenge02:challenge02 | sudo chpasswd

serverfolderlocation = /srv/.S€(RE]/
sudo mkdir $serverfolderlocation
sudo cp -R ./app/ $serverfolderlocation
sudo cp ./config $serverfolderlocation
