#!/bin/bash
command=$1
if [[ "$command" == "SSHKeyPassphrase" ]]
then
    echo "01.SSHKeyPassphrase" > /srv/hackerman/status
fi