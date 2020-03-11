#!/bin/bash
# challenge00 installation script
## Add the user challenge00 to system and give it a password
sudo adduser challenge00 --disabled-login --gecos "" 
echo challenge00:challenge00 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge00/ and make user and group challenge00 the owner of it. Also set the right permissions
sudo cp ./todo.txt /home/challenge00/todo.txt
sudo chown challenge00:challenge00 /home/challenge00/todo.txt
sudo chmod 775 /home/challenge00/todo.txt
## supersecret
sudo cp ./supersecret /home/challenge00/.supersecret
sudo chown challenge00:challenge00 /home/challenge00/.supersecret
sudo chmod 775 /home/challenge00/.supersecret