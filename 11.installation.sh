#!/bin/bash

#dnf install git -y
USERID=$(id -u)

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please try with superuser"
  exit 1

fi

dnf list installed git 

if [ $? -ne 0 ]
then 
    echo "git is not installing, Please wait git is ready to install"
    dnf install git -y
else
    echo "git is allready installed"
fi
