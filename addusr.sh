#!/bin/bash


<<readme

this is for add and dlt usr

readme

echo "==============Creation for usr=================="

read -p "Enter the username the you want to add: " username


if id "$username" &>/dev/null; then
  echo "⚠️ User '$username' already exists."
  exit 1
fi


read -sp "Enter he password: " password
echo
read -sp "ReEnter the password to confirm: " password
echo

useradd -m "$username"

echo "$username:$password" | sudo chpasswd



echo "✅ User '$username' created successfully with home directory."

echo "====================usr creation has been completed================"


