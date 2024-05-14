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

dnf install mysql -y &>>$LOG_FILE

VALIDATE $? "installing mysql"

dnf install git -y &>>$LOG_FILE

VALIDATE $? "installing git"

echo "is Script Procedding"

