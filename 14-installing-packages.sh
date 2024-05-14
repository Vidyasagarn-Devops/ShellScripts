#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2..... $R Failure $N"
        exit 1
    else
        echo "$2.... $G Success $N"
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
    echo -e "$i Already Installed.... $Y SKIPPING $N"
else
    echo "$i Not Installed.... need to install"
fi
done

