#!/bin/bash


<< help 

this is for change passwd

help


#!/bin/bash

# Script to change a user's password using 'passwd'

# Prompt for username
read -p "Enter the username: " username

# Check if user exists
if ! id "$username" &>/dev/null; then
    echo "❌ User '$username' does not exist!"
    exit 1
fi

# Call passwd interactively
echo "🔐 Now changing password for user '$username'..."
sudo passwd "$username"

