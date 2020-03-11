# Install and configure server as is needed for the challenges
## Update packages
sudo apt update
sudo apt dist-upgrade
## Add Node.js LTS repositories
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
## Install needed software for challenges with package manager APT
sudo apt install -y openssh-server nodejs git vsftpd
## Enable SSH
sudo systemctl enable ssh.service
## Allow SSH port to be exposed in order to be able to connect with it
sudo ufw allow 22/tcpA
## Display greeting message when server boots to console
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 | sudo tee /etc/issue
## Do not allow non wheel user accounts to login and enter the console so SSH must be used.
echo -:ALL EXCEPT (wheel) shutdown sync:LOCAL | sudo tee -a /etc/security/access.conf
## Clone the latest version of the the MegaMaxCorpInc intranet to /srv/intranet
cd /srv/
sudo git clone https://github.com/DamionGans/MegaMaxCorpinc-Intranet.git intranet
## Create /srv/hackerman with a socket so all of hackerman's applicatons can communicate with each other.
sudo mkdir /srv/hackerman/
sudo touch /srv/hackerman/socket
sudo chmod 777 /srv/hackerman/socket

# install challenges (WIP as all challenges will eventually move to their own subfolder)
bash challenge00/install.sh
bash challenge01/install.sh
bash challenge02/install.sh

sudo adduser challenge02 --disabled-login --gecos "" 
echo challenge02:challenge02 | sudo chpasswd
sudo adduser challenge00 --disabled-login --gecos "" 
echo challenge02:challenge02 | sudo chpasswd
sudo adduser challenge03 --disabled-login --gecos "" 
echo challenge03:challenge03 | sudo chpasswd
sudo adduser challenge03 --disabled-login --gecos "" 
echo challenge03:challenge03 | sudo chpasswd
sudo adduser challenge04 --disabled-login --gecos "" 
echo challenge04:challenge04 | sudo chpasswd
sudo adduser challenge05 --disabled-login --gecos "" 
echo challenge05:challenge05 | sudo chpasswd
sudo adduser challenge06 --disabled-login --gecos "" 
echo challenge06:challenge06 | sudo chpasswd
sudo adduser challenge07 --disabled-login --gecos "" 
echo challenge07:challenge07 | sudo chpasswd
sudo adduser challenge08 --disabled-login --gecos "" 
echo challenge08:challenge08 | sudo chpasswd
sudo adduser challenge09 --disabled-login --gecos "" 
echo challenge09:challenge09 | sudo chpasswd
sudo adduser challenge10 --disabled-login --gecos "" 
echo challenge10:challenge10 | sudo chpasswd

# Last server configurations and reboot
## Deny SSH connections to localhost. This way the SSH keys must *somehow* be downloaded to the local pc.
echo sshd : localhost : deny | sudo tee -a /etc/hosts.deny