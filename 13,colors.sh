#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please try with superuser"
  exit 1

fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 mysql is not $R installed.. check the cmd":$N
    else
        echo -e "$2 mysql $G is installing"
    fi


}

dnf list installed git 

VALIDATION $? "LIsiting git"

if [ $? -ne 0 ]
then 
    echo "git is not installing, Please wait git is ready to install"
    dnf install git -y
else
    echo "git is allready installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is ready to install is in progress"
    dnf install mysql -y
    VALIDATION $? "installed is done mysql"
    systemctl start mysql $G
    systemctl status mysql $G
else
    echo "mysql is already installed"
fi
