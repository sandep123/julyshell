#!/bin/bash


<< help

this is for deletion of usr

help


echo "=========deletion of usr has started ================"



read -p "the the usrnamee ypu want ot dlt:" username


if ! id "$username" &>/dev/null; then
  echo "❌ User '$username' does not exist!"
  echo "⚠️ Please enter the correct username."
  exit 1
fi


userdel "$username"



echo "============usr has been deletd================="

cat /etc/passwd | grep "$username" | wc 

echo "as wc is 0 usr has been dleted"
