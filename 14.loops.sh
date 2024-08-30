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
    echo $packages
done

