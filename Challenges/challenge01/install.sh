# Challenge 01 installation script
## Add the user challenge01 to system and give it a password
sudo adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge00/ and make user and group challenge00 the owner of it.  
sudo cp ./todo.txt /home/challenge00/.
sudo chown challenge00:challenge00 /home/challenge00/todo.txt
## Copy the .challenge01sshkeypassprahse file to /bin/ of challenge00 and make user root and group challenge00 the owner of it.  
sudo cp ./.challenge01sshkeypassprahse /bin/.
sudo chown root:challenge00 /bin/.challenge01sshkeypassprahse
## Make /bin/.challenge01sshkeypassprahse executable
sudo chmod +x /bin/.challenge01sshkeypassprahse