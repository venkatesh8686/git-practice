#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
TIMESTAMP=$(date +%Y-%m-%d-%h-%m-%S)
LOG_FILES="$LOGS_FOLDER/$SCRIPT_NAME/$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER 


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please run this script with root privallages $R" &>> $LOG_FILES
  exit 1

fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is..$R failed.. check the cmd $N" &>> $LOG_FILES
    else
        echo "$2.. is installing $G"
    fi

}

echo "Running the script"

for packages in $@
do
    dnf list installed $packages &>> $LOG_FILES
    if [ $? -ne 0 ]
    then
        echo "$packages not installed .. is started installing" &>> $LOG_FILES
        dnf install -y $packages
        VALIDATION $? "installing $packages"
    else
        echo "$packages is already installed nothing to do"&>> $LOG_FILES
    fi

done
