#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 ) &>> $LOG_FILES
TIME_STAMP=$(Date+%y-%m-%d-%H-%m-%s) &>> $LOG_FILES
LOG_FILES="$LOGS_FOLDER/$SCRIPT_NAME/$TIME_STAMP"
mkdir -p $LOG_FILES 


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "$R please run this script with root privallages" &>> $LOG_FILES
  exit 1

fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is..$R failed.. check the cmd $N"
    else
        echo "$2.. is installing $G"
    fi

}


for packages in $@
do
    dnf list installed $packages
    if [ $? -ne 0 ]
    then
        echo "$packages not installed .. is started installing"
        dnf install -y $packages
        VALIDATION $? "installing $packages"
    else
        echo "$packages is already installed nothing to do"
    fi

done
