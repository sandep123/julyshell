#!/bin/bash


<< readme

this script for backup  with 5 days roation 


Usages:

./backup.sh <path to your source> <path to backup folder>

readme


function display_usage {
    echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

if [ $# -eq 0 ]; then
    display_usage
    exit 1
fi


Source_dir=$1

timestamp=$(date +'%Y-%m-%d-%H-%M-%S')

backup_dir=$2




function create_backup {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${Source_dir}"
    
    if [ $? -eq 0 ]; then
        echo "Backup has been taken successfully for timestamp: ${timestamp}"
    else
        echo "Backup failed for timestamp: ${timestamp}"
        exit 1
    fi
}


function perform_rotation {

	backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
	
	if [ "${#backups[@]}"  -gt 5 ]; then
		echo "perform rotation for 5 days"
		backups_to_remove=("${backups[@]:5}")
			


		for backup in "${backups_to_remove[@]}";
		do 
			rm -f "$backup"

		done	
	fi



}

create_backup

perform_rotation
