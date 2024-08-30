#!/bin/bash

# G="\e[32m"

# for i in {0..100}
# do
#     echo "this is i value : $i" $G 
# done

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
        echo "$2 is..$R failed.. check the cmd $N"
    else
        echo "$2..$G is installing"
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

