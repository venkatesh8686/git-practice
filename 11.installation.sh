#!/bin/bash

#dnf install git -y
USERID=$(id -u)

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please try with superuser"
else
  echo "installation started"
fi

dnf install git -y