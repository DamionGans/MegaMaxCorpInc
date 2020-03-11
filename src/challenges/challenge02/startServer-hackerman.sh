#!/bin/bash
readarray -t configFile </srv/hackerman/.S€CRET/config
if  [4 -gt ${#configFile[@]} ];
then
    echo "02.startServerFail" >> /srv/hackerman/socket
    exit 1
fi
enabledCount=0
commentCount=0
wrongCount=0
for i in "${arr[@]}"; do
    if [ $i = "enabled" ]; then
        ((enabledCount++))
    elif [[ $i = "#*" ]]; then
        ((commentCount++))
    else
        ((wrongCount++))
    fi
done

if [[ $enabledCount -le 2 && $wrongCount -eq 0 && commentCount -le 2 ]] 
then
    echo "02.startServerSucces" >> /srv/hackerman/socket
    exit 0
else
    echo "02.startServerFail" >> /srv/hackerman/socket
    exit 1
fi
done
