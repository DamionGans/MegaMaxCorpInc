#!/bin/bash
readarray -t configFile </srv/.S€CRE]/config
if  [[ 4 -gt ${#configFile[@]} ]]
then
    echo "02.startServerFail" >> /srv/hackerman/socket
    exit 1
fi
declare -i enabledCount=0
declare -i commentCount=0
declare -i wrongCount=0
for i in "${configFile[@]}"
do
    if [[ "$i" == "enabled" ]]
    then
        enabledCount+=1
    elif [[ "$i" == "#"* ]]
    then
        commentCount+=1
    else
        wrongCount+=1
    fi
done

if [[ "$enabledCount" -le 2 && "$wrongCount" -eq 0 && "$commentCount" -le 2 ]]
then
    systemctl start vsftpd
    echo "02.startServerSucces" >> /srv/hackerman/socket
    exit 0
else
    systemctl stop vsftpd
    echo "02.startServerFail" >> /srv/hackerman/socket
    exit 1
fi
done
