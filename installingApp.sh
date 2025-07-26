#!/bin/bash


#the is for installig new applcation

read -p "enter the url of thefile name:" url


if ! command -v wget &> dev/null; then
       echo "cmd is not present.. install liya"
	sudo apt update
	sudo apt install wget
else
	echo "installed alreday"

fi

filename=$(basename "$url")

echo "downloading the file .......$filename"


wget "$url" -O "$filename"


if [ !? -eq 0 ]; then
	 echo "✅ Download successful: $filename"
else
    echo "❌ Download failed."
fi




