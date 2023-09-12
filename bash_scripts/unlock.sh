#!/usr/bin/bash

#This script is used to unlock the device that has been specified.

#Define function to acquire device name
name(){
echo -e "\nEnter Device Name: \n"
read name
}

#Define function to run the command
Command(){
kdeconnect-cli --name "$name" --unlock
}

#Define main function
main(){
name
Command
}

#Run main function
main
