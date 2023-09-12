#!/usr/bin/bash

#This script is used to send a URL or a file using its path to the device using its device ID.

#Define function to acquire URL/File Path
Path(){
echo -e "\nEnter URL/File Path : \n"
read path
}

#Define function to acquire the Device ID
DeviceID(){
echo -e "\nEnter Device ID : \n"
read id
}

#Define function to run the command
Command(){
kdeconnect-cli --share $path --device $id
}

#Define main function
main(){
Path
DeviceID
Command
}

#Run main function
main
