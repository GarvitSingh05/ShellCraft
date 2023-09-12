#!/usr/bin/bash

# This bash script can be used to compress files and directories by creating tarballs(.tar.gz) and upload them on your google drive, provided you've already set up your gdrive file.

# Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

# Taking filenames or directories as Input which are to be compressed.

    echo -e "\nEnter the filenames\directories to be compressed into tarball:\n"
    read filenames

# Taking the path as input where the compressed tarball has to be stored. Most of the times, it will be the same directory. Just type .(current directory) for it. Type the full path if otherwise.

    echo -e "\nEnter the path where tarball has to be stored :\n"
    read path

# Finally, bringing all those input parameters together and putting them into the final command and executing it.

    tar -czvf $filenames.tar.gz $path

# Ask the user if they want to Upload this compressed tarball to google drive. Store the input (y/n) in a variable.

    echo -e "\nDo you want to upload the compressed tarball to your google drive for backup(y/n)\n"
    read choice

# Initialise the filename ./gdrive to a variable.

    google=./gdrive

# If the user enters y as the choice.

if [ $choice == y ];

then

# Check if the user has set up his gdrive file or not.

if [ -e "$google" ];

then

# If ./gdrive has been properly set-up, then this command would do the work and upload the compressed tarball to the user's google drive.

    echo -e "\nPreparing to upload the files....\n"
    echo -e "Please wait till the upload finishes....\n"
    ./gdrive upload $filenames.tar.gz
    echo -e "\nTask Successful!\n"

else

# If ./gdrive hasnt been set-up, then give the user instructions as to how they set it up.

    echo -e "\nPlease set up your gdrive file first. Refer this article from Medium explaining how to setup gdrive : https://bit.ly/3mBvi4C. Download the source files from : https://github.com/BugCode1/gdrive/releases/tag/2.1.2 and follow all the instructions in it.\n"

fi

else

    echo -e "\nHope this was useful\n"
fi

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n\n"
