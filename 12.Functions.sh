#!/bin/bash


USERID=$(id -u)

#echo "user id is : $USERID"

if [ $USERID -ne 0 ]
then
  echo "please try with superuser"
  exit 1

fi

VALIDATION(){

    echo "exit code is : $1"

}

dnf list installed git 

VALIDATION $?

# if [ $? -ne 0 ]
# then 
#     echo "git is not installing, Please wait git is ready to install"
#     dnf install git -y
# else
#     echo "git is allready installed"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is ready to install is in progress"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then 
#         echo "mysql is not installed.. check the cmd"
#         exit 1
#     else
#         echo "mysql is installing"
#     fi
# else
#     echo "mysql is already installed"
# fi
