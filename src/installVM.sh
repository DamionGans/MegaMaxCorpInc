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

cd ./
## Install the intranet service
bash services/intranet/install.sh
## Install the socketreader service
bash services/socketreader/install.sh
# install challenges (WIP as all challenges will eventually move to their own subfolder)
bash challenge00/install.sh
bash challenge01/install.sh
bash challenge02/install.sh

# Last server configurations and reboot
## Deny SSH connections to localhost. This way the SSH keys must *somehow* be downloaded to the local pc.
#echo sshd : localhost : deny | sudo tee -a /etc/hosts.deny