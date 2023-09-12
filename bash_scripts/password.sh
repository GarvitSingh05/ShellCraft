#!/usr/bin/bash

# This bash script is used to create a random & strong password using gpg command. If used with --armor the output will be base64 encoded. If user wants password to be stored to a file, then the file must be created before running the bash script.

# Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

# Entry Message

    echo -e "\n###Welcome to Password Generator###\n"

# Taking quality level 0, 1 or 2 as input. If count is not given or zero, an endless sequence of random bytes will be emitted

    echo -e "\nEnter the quality level 0, 1 or 2 :\n"
    read quality_level

# Checking if the user has entered a valid quality level using if condition.

if [ $quality_level == 0 ] || [ $quality_level == 1 ] || [ $quality_level == 2 ];

then

# Taking password length input from user

    echo -e "\nEnter the length of password :\n"
    read characters

# Finally, bringing all the input paramters together and putting them into the final command and executing it. Store that password in variable pass.

    echo -e "\nYour password is :\n"
    pass=$(gpg --gen-random --armor $quality_level $characters)
    echo -e "$pass"

# Write a message informing the user that the input entered is invalid.

else

    echo -e "\nWrong Input.\nOnly 0, 1 and 2 are valid inputs.\n"

fi

# Ask the user if they want to save the password to a file.

    echo -e "\nWould you like to save this password to a file?(y/n)\n"
    read choice

# Use if condition to check wether user has put in y or n and execute the respective blocks of code.

if [ $choice == y ];

then

# Ask for the filename to store the password in.

    echo -e "\nEnter filnename\path to store the password\n"
    read filename

# Store the password in the file.

    echo "$pass" > $filename

# Prompt the user about the successful completion of password generation and storing it.

echo -e "\nYou have successfully generated and stored your strong password\n"

else

# Exit message if the user doesnt want to store it in a file.

    echo -e "\nHope this was useful!\n"

fi

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"
