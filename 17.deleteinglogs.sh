#!/bin/bash

SOURCE_DRI=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DRI ]
then 
    echo -e "$SOURCE_DRI $G is exits $N"
else
    echo "$SOURCE_DRI $R not exits $N"
    exit 1
fi
