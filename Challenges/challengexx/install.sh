#!/bin/bash
# challengexx installation script
## Add the user challengexx to system and give it a password
sudo adduser challengexx --disabled-login --gecos "" 
echo challengexx:challengexx | sudo chpasswd
## Copy the todo.txt file to the /home/challengexx/ and make user and group challengexx the owner of it. Also set the right permissions
sudo cp ./todo.txt /home/challengexx/.todo.txt
sudo chown challenge00:challenge00 /home/challenge00/.todo.txt
sudo chmod 775 /home/challengexx/.todo.txt
## Below is the challenge itself