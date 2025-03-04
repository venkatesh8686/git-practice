#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILES="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER 


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo -e "$R please run this script with root privallages" | tee -a $LOG_FILES
  exit 1

fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$R $2 is.. .failed.. check the cmd " &>> $LOG_FILES
    else
        echo "$G $2.. is installing" | tee -a $LOG_FILES
    fi
}

USAGE(){
    
    echo -e "$R USAGE:: sudo sh 15-redirectors.sh package1,package2.. $N" | tee -a $LOG_FILES
    exit 1 
}

echo "Shell scrtiping started working:: $(date)" | tee -a $LOG_FILES

if [ $# -eq 0 ]
then
    USAGE
fi

for packages in $@
do
    dnf list installed $packages &>> $LOG_FILES
    if [ $? -ne 0 ]
    then
        echo "$packages not installed .. is started installing" | tee -a $LOG_FILES
        dnf install -y $packages
        VALIDATION $? "installing $packages"
    else
        echo -e "$Y $packages is already installed nothing to do" | tee -a $LOG_FILES
    fi

done
