#!/bin/bash
cd /srv/
sudo mkdir intranet
sudo cp app/* /srv/intranet/.
cd /srv/intranet
sudo npm install