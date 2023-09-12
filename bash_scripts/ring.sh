#!/usr/bin/bash

#This script is used to ring your device.

#Define a function for device name
device_name(){
echo -e "\nEnter device name to ring : \n"
read name
}

#Define a function to run the command
Command(){
kdeconnect-cli --ring --name "$name"
}


#Define main function
main(){
device_name
Command
}

#Run main function
main
