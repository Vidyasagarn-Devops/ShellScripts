#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
    echo 

dnf install mysql -y