#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status : $1"
    echo "what we are doing : $2"

}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1
else
    echo "You are super user"
fi

dnf install mysql -y

VALIDATE $? installing software

dnf install git -y

VALIDATE $? installing software

echo "is Script Procedding"

