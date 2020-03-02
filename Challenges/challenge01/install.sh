# challenge 01
sudo adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 | sudo chpasswd
sudo mv ./todo.txt /home/challenge00/.
echo "echo '01.01.r' >> /srv/hackerman/socket" | sudo tee -a /bin/.challenge01sshkeypassprahse
echo "echo 'I have never seen an entity such as badly secured as this server, I have to do something...'" | sudo tee -a /bin/.challenge01sshkeypassprahse
sudo chmod +x /bin/.challenge01sshkeypassprahse 