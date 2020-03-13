#!/bin/bash
cd "$(dirname $0)"
# Install and configure server as is needed for the challenges
## Update packages
apt update
apt -y dist-upgrade
## Add Node.js 12.x repositories
curl -sL https://deb.nodesource.com/setup_12.x | bash -
## Install needed software for challenges with package manager APT
apt install -y nodejs git vsftpd
## Display greeting message when server boots to console
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 |  tee /etc/issue
## Do not allow non wheel user accounts to login and enter the console so SSH must be used.
echo "-:ALL EXCEPT (wheel) shutdown sync:LOCAL" |  tee -a /etc/security/access.conf
## Install the intranet service
mkdir /srv/intranet
cp -r services/intranet/app/* /srv/intranet/.
npm install /srv/intranet/
ufw allow 80/tcp
cp services/intranet/intranet.service /etc/systemd/system/.
systemctl enable intranet
## Install the socketreader service
mkdir /srv/hackerman/
touch /srv/hackerman/socket
chmod 777 /srv/hackerman/socket
touch /srv/hackerman/status
chown hackerman:root /srv/hackerman/status
chmod 770 /srv/hackerman/status
cp services/socketreader/socketreader /srv/hackerman/socketreader
cp services/socketreader/socketreader.service /etc/systemd/system/.
systemctl enable socketreader
echo "00.installed" > /srv/hackerman/status
# install challenges (WIP as all challenges will eventually move to their own subfolder)
# challenge00 installation script
## Add the user challenge00 to system and give it a password
adduser challenge00 --disabled-login --gecos "" 
echo challenge00:challenge00 |  chpasswd
## Copy the todo.txt file to the /home/challenge00/ and make user and group challenge00 the owner of it. Also set the right permissions
cp challenges/challenge00/todo.txt /home/challenge00/todo.txt
chown challenge00:hackerman /home/challenge00/todo.txt
chmod 775 /home/challenge00/todo.txt
## Copy the socketreader handler to /srv/hackerman/challengexx/
mkdir /srv/hackerman/challenge00
cp challenges/challenge00/handler.sh /srv/hackerman/challenge00/handler.sh
chown hackerman:root /srv/hackerman/challenge00/handler.sh
chmod 770 /srv/hackerman/challenge00/handler.sh
## supersecret
cp challenges/challenge00/supersecret /home/challenge00/.supersecret
chown challenge00:hackerman /home/challenge00/.supersecret
chmod 775 /home/challenge00/.supersecret
# challenge01 installation script
## Add the user challenge01 to system and give it a password
adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 |  chpasswd
## Copy the todo.txt file to the /home/challenge01/ and make user and group challenge01 the owner of it. Also set the right permissions
cp challenges/challenge01/todo.txt /home/challenge01/.todo.txt
chown challenge01:hackerman /home/challenge01/.todo.txt
chmod 775 /home/challenge01/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge01/
mkdir /srv/hackerman/challenge01
cp challenges/challenge01/handler.sh /srv/hackerman/challenge01/handler.sh
chown hackerman:root /srv/hackerman/challenge01/handler.sh
chmod 770 /srv/hackerman/challenge01/handler.sh
## Copy the .challenge01sshkeypassprahse file to /bin/ of challenge01 and make user root and group challenge01 the owner of it.  
cp challenges/challenge01/challenge02sshkeypassprahse /bin/.challenge02sshkeypassprahse
chown challenge01:hackerman /bin/.challenge02sshkeypassprahse
## Make /bin/.challenge01sshkeypassprahse executable
chmod +x /bin/.challenge02sshkeypassprahse

# challenge02 installation script
## Add the user challenge02 to system and give it a password
adduser challenge02 --disabled-login --gecos "" 
echo challenge02:challenge02 |  chpasswd
## Copy the todo.txt file to the /home/challenge02/ and make user and group challenge02 the owner of it. Also set the right permissions
cp challenges/challenge02/todo.txt /home/challenge02/.todo.txt
chown challenge02:hackerman /home/challenge02/.todo.txt
chmod 775 /home/challenge02/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge02/
mkdir /srv/hackerman/challenge02
cp challenges/challenge02/handler.sh /srv/hackerman/challenge02/handler.sh
chown hackerman:root /srv/hackerman/challenge02/handler.sh
chmod 770 /srv/hackerman/challenge02/handler.sh
## Create the Secret webserver config and startup files
mkdir /srv/.S€CRE]/
cp challenges/challenge02/config /srv/.S€CRE]/.
chmod 770 /srv/.S€CRE]/config
chown challenge02:hackerman /srv/.S€CRE]/config
cp challenges/challenge02/startServer.sh /srv/.S€CRE]/.
mkdir /srv/.S€CRE]/data
cp challenges/challenge02/index.html /srv/.S€CRE]/data/.
echo "anon_root=/srv/.S€CRE]/data/" >> /etc/vsftpd.conf
echo "local_root=/" >> /etc/vsftpd.conf
sed -i  s/anonymous_enable=NO/anonymous_enable=YES/g /etc/vsftpd.conf
service vsftpd stop
cp challenges/challenge02/passphrase /srv/.S€CRE]/data/.
chmod 770 /srv/.S€CRE]/startServer.sh
chown challenge02:hackerman /srv/.S€CRE]/startServer.sh
cp challenges/challenge02/startServer-hackerman.sh /srv/hackerman/challenge02/
chmod 770 /srv/hackerman/challenge02/startServer-hackerman.sh
chown hackerman:root /srv/hackerman/challenge02/startServer-hackerman.sh

# Last server configurations and reboot
## Deny SSH connections to localhost. This way the SSH keys must *somehow* be downloaded to the local pc.
#echo sshd : localhost : deny |  tee -a /etc/hosts.deny