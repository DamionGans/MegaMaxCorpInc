#!/bin/bash
cd "$(dirname $0)"
sudo mkdir /srv/hackerman/
sudo touch /srv/hackerman/socket
sudo chmod 777 /srv/hackerman/socket
sudo cp socketreader /srv/hackerman/socketreader
sudo cp socketreader.service /etc/systemd/systems/socketreader.service
sudo systemctl enable socketreader
sudo systemctl start socketreader