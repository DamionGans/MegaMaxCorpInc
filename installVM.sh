# Basic setup
sudo apt update
sudo apt dist-upgrade
# install and configure software needed for challenges
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y openssh-server nodejs git
sudo systemctl enable ssh.service
sudo ufw allow 22/tcp
echo MegaMaxCorpInc server booted. Please login to our intranet website at address \\4 | sudo tee /etc/issue
echo sshd : localhost : deny | sudo tee -a /etc/hosts.deny
echo -:ALL EXCEPT (wheel) shutdown sync:LOCAL | sudo tee -a /etc/security/access.conf
cd /srv/
sudo git clone https://github.com/DamionGans/MegaMaxCorpinc-Intranet.git intranet

# Create 10 challenge users
sudo adduser challenge00 --disabled-login --gecos "" 
echo challenge00:challenge00 | sudo chpasswd
sudo adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 | sudo chpasswd
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

# challenge 00
# no additional commands needed

# challenge 01
sudo mv challenge01/todo.txt /home/challenge00/.
sudo mkdir /srv/hackerman/
sudo touch /srv/hackerman/socket
sudo chmod 777 /srv/hackerman/socket
echo "echo '01.01.r' >> /srv/hackerman/socket" | sudo tee -a /bin/challenge01sshkeypassprahse
echo "echo 'I have never seen an entity such as badly secured as this server, I have to do something...'" | sudo tee -a /bin/challenge01sshkeypassprahse
sudo chmod +x /bin/challenge01sshkeypassprahse 