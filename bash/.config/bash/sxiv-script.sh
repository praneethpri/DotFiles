#!/bin/bash

if [[ -z $0 ]]
then
    NAME=$(basename $PWD)
    cd ..
    sxiv -t $NAME
else
    command sxiv
fi
