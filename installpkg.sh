#!/bin/bash

<< help
this is for download shell

help


echo "installing $1"


if [ $# -eq 0 ]; then
    echo "Please enter the arguments."
    exit 1
fi


if dpkg -s "$1" &>/dev/null; then
    echo "✅ Package '$1' is already installed."
    exit 1
else
    echo "❌ Package '$1' is not installed."
fi



echo "Installing '$1' now..."

sudo apt update

sudo apt-get install $1 -y


echo "pkg has been install...."
