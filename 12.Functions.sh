#!/bin/bash


USERID=$(id -u)

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please try with superuser"
  exit 1

fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 mysql is not installed.. check the cmd"
    else
        echo "$2 mysql is installing"
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
    systemctl status mysql
else
    echo "mysql is already installed"
fi
