#!/bin/bash
cd "$(dirname $0)"
# challenge01 installation script
## Add the user challenge01 to system and give it a password
sudo adduser challenge01 --disabled-login --gecos "" 
echo challenge01:challenge01 | sudo chpasswd
## Copy the todo.txt file to the /home/challenge01/ and make user and group challenge01 the owner of it. Also set the right permissions
sudo cp ./todo.txt /home/challenge01/.todo.txt
sudo chown challenge01:challenge01 /home/challenge01/.todo.txt
sudo chmod 775 /home/challenge01/.todo.txt
## Copy the socketreader handler to /srv/hackerman/challenge01/
sudo cp handler.sh /srv/hackerman/challenge01/handler.sh
sudo chown hackerman:root /srv/hackerman/challenge01/handler.sh
sudo chmod 770 /srv/hackerman/challenge01/handler.sh
## Copy the .challenge01sshkeypassprahse file to /bin/ of challenge01 and make user root and group challenge01 the owner of it.  
sudo cp ./challenge01sshkeypassprahse /bin/.
sudo chown root:challenge01 /bin/.challenge02sshkeypassprahse
## Make /bin/.challenge01sshkeypassprahse executable
sudo chmod +x /bin/.challenge02sshkeypassprahse