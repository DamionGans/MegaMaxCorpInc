#!/bin/bash
cd "$(dirname $0)"
# Install and configure server as is needed for the challenges
## Update packages
sudo apt update
sudo apt -y dist-upgrade
## Add Node.js 12.x repositories
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
## Install needed software for challenges with package manager APT
sudo apt install -y nodejs git vsftpd
## Display greeting message when server boots to console
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 | sudo tee /etc/issue
## Do not allow non wheel user accounts to login and enter the console so SSH must be used.
echo "-:ALL EXCEPT (wheel) shutdown sync:LOCAL" | sudo tee -a /etc/security/access.conf
## Install the intranet service
sudo mkdir /srv/intranet
sudo cp services/intranet/app/* /srv/intranet/.
sudo npm install /srv/intranet/
sudo cp services/intranet/intranet.service /etc/systemd/system/intranet.service
sudo systemctl enable intranet
sudo systemctl start intranet
## Install the socketreader service
sudo mkdir /srv/hackerman/
sudo touch /srv/hackerman/socket
sudo chmod 777 /srv/hackerman/socket
sudo cp services/socketreader/socketreader /srv/hackerman/socketreader
sudo cp services/socketreader/socketreader.service /etc/systemd/system/socketreader.service
sudo systemctl enable socketreader
sudo systemctl start socketreader
# install challenges (WIP as all challenges will eventually move to their own subfolder)
# challenge00 installation script
## Add the user challenge00 to system and give it a password
sudo adduser challenge00 --disabled-login --gecos "" 
echo challenge00:challenge00 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge00/ and make user and group challenge00 the owner of it. Also set the right permissions
sudo cp challenges/challenge00/todo.txt /home/challenge00/todo.txt
sudo chown challenge00:challenge00 /home/challenge00/todo.txt
sudo chmod 775 /home/challenge00/todo.txt
## Copy the socketreader handler to /srv/hackerman/challengexx/
sudo cp challenges/challenge00/handler.sh /srv/hackerman/challenge00/handler.sh
sudo chown hackerman:root /srv/hackerman/challenge00/handler.sh
sudo chmod 770 /srv/hackerman/challenge00/handler.sh
## supersecret
sudo cp challenges/challenge00/supersecret /home/challenge00/.supersecret
sudo chown challenge00:challenge00 /home/challenge00/.supersecret
sudo chmod 775 /home/challenge00/.supersecret
# challenge01 installation script
## Add the user challenge01 to system and give it a password
sudo adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge01/ and make user and group challenge01 the owner of it. Also set the right permissions
sudo cp challenges/challenge01/todo.txt /home/challenge01/.todo.txt
sudo chown challenge01:challenge01 /home/challenge01/.todo.txt
sudo chmod 775 /home/challenge01/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge01/
sudo cp challenges/challenge01/handler.sh /srv/hackerman/challenge01/handler.sh
sudo chown hackerman:root /srv/hackerman/challenge01/handler.sh
sudo chmod 770 /srv/hackerman/challenge01/handler.sh
## Copy the .challenge01sshkeypassprahse file to /bin/ of challenge01 and make user root and group challenge01 the owner of it.  
sudo cp challenges/challenge01/challenge01sshkeypassprahse /bin/.
sudo chown root:challenge01 /bin/.challenge02sshkeypassprahse
## Make /bin/.challenge01sshkeypassprahse executable
sudo chmod +x /bin/.challenge02sshkeypassprahse

# challenge02 installation script
## Add the user challenge02 to system and give it a password
sudo adduser challenge02 --disabled-login --gecos "" 
echo challenge02:challenge02 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge02/ and make user and group challenge02 the owner of it. Also set the right permissions
sudo cp challenges/challenge02/todo.txt /home/challenge02/.todo.txt
sudo chown challenge02:challenge02 /home/challenge02/.todo.txt
sudo chmod 775 /home/challenge02/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge02/
sudo cp challenges/challenge02/handler.sh /srv/hackerman/challenge02/handler.sh
sudo chown hackerman:root /srv/hackerman/challenge02/handler.sh
sudo chmod 770 /srv/hackerman/challenge02/handler.sh
## Create the Secret webserver config and startup files
sudo mkdir /srv/.S€CRE]/
sudo cp -R challenges/challenge02/app/ /srv/.S€CRE]/
sudo cp challenges/challenge02/config /srv/.S€CRE]/
sudo cp challenges/challenge02/startServer.sh /srv/.S€CRE]/
sudo chmod 770 /srv/.S€CRE]/startServer.sh
sudo chown challenge02:hackerman /srv/.S€CRE]/startServer.sh
sudo mkdir /srv/hackerman/challenge02/
sudo cp challenges/challenge02/startServer-hackerman.sh /srv/hackerman/challenge02/
sudo chmod 770 /srv/hackerman/challenge02/startServer-hackerman.sh
sudo chown hackerman:root /srv/hackerman/challenge02/startServer-hackerman.sh

# Last server configurations and reboot
## Deny SSH connections to localhost. This way the SSH keys must *somehow* be downloaded to the local pc.
#echo sshd : localhost : deny | sudo tee -a /etc/hosts.deny