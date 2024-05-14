#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script Started Executing: $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.....$R Failure $N "
        exit 1
    else
        echo -e "$2.... $G Success  $N "
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

dnf install dockerr -y &>>$LOG_FILE

VALIDATE $? "installing docker"

echo "is Script Procedding"

