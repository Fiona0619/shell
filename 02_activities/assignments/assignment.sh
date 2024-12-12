#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir -p ./data
# 2. Move the ./rawdata directory to ./data/raw
# Commend 'mv ./rawdata ./data/raw' will do this. If the data directory doesn't exist, create it then run the commend.
mkdir -p ./data
mv ./rawdata ./data/raw
#Verify the move:
Is ./data
# If the data show up, the moving is successiful.

# 3. List the contents of the ./data/raw directory
#To list the contents of the ./data/raw directory, you can use the ls command:
ls ./data/raw


# 3. List the contents of the ./data/raw directory
ls ./data/raw
# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
# Command:
mkdir -p ./data/processed/server_logs ./data/processed/user_logs ./data/processed/event_logs
# Verify the Directory Creation, list the contents of './data/processed':
Is ./data/processed
# server_logs, user_logs, and event_logs directions would be seen.

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
# Run the command:
cp ./data/raw/*server*.log  ./data/processed/server_logs/
# To confirm that the files were copied, list the contents of destination:
Is ./data/processed/server_logs
#You should see all the relevant files with "server" in their names and a .log extension.

# 6. Repeat the above step for user logs and event logs
#Copy files
cp ./data/raw/*user*.log  ./data/processed/user_logs/
cp .data/raw/*event*.log  ./data/processed/event_logs/
# Confirm that the files were copied
Is ./data/processed/user_logs
Is ./data/processed/event_logs

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rm ./data/raw/*ipaddr*
rm ./data/processed/user_logs/*ipaddr*

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
 touch ./data/inventory.txt ./data/processed
touch ./data/inventory.txt ./data/processed



bash assignment.sh


###########################################

echo "Project setup is complete!"
