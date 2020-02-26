#!/bin/bash
echo 'This file will not be touched untill everything else is done. For now, it does not work because of that.' 

if [[ $# -eq 1 ]] && [[$1 -eq "--help"]]; then
    echo 'Usage: MegaMaxCorpInc-VMBuilder [Command] [argument1] [argument2] ....'
    echo 'Commands:'
    echo 'Build - builds the image'
    echo 'Arguments:'
    echo '--help - this helping text'
    echo 'more arguments to come....'
    exit 1
else if [[$# -ge 1 ]] && [[$1 -eq "build"]]; then
    #do stuff
    #this code won't be continued untill later on.
    exit 1
else
    echo 'Usage: MegaMaxCorpInc-VMBuilder [Command] [argument1] [argument2] ....'
    echo 'Use --help for more information.'
    exit 1
fi