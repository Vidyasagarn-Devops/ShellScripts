#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.....Failure"
        exit 1
    else
        echo "$2....Success"
    fi

}


if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1
else
    echo "You are super user"
fi

for i in $@
do
echo " Package to install: $i"
dnf list installed $i &>>$LOG_FILE
if [ $? -eq 0 ]
then
    echo "$i Already Installed....SKIPPING"
else
    echo "$i Not Installed.... need to install"
done

