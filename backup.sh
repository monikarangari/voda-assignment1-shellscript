#!/bin/bash

# Check if the directory path is provided while running the script
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

# Assign the directory path to a variable
DIR_PATH=$1

# Check if the above directory exists in system
if [ ! -d "$DIR_PATH" ]; then
  echo "Error: Directory $DIR_PATH does not exist."
  exit 1
fi

# to get the current date and time
CURRENT_DATE=$(date +"%Y%m%d_%H%M%S")

# Assign variable for the backup file name
BACKUP_FILE="backup_${CURRENT_DATE}.tar.gz"

# Create the backup using above variable
tar -czf $BACKUP_FILE -C "$DIR_PATH" .

# Check if the backup created successful
if [ $? -eq 0 ]; then
  echo "Backup has been created successful: $BACKUP_FILE"
else
  echo "Error: Backup failed."
  exit 1
fi
