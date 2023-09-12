#!/usr/bin/bash

# This bash script can be used to de-compress(extract) files and directories from tarballs(.tar.gz).

# Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

# Taking tarball name as Input which is to be de-compressed.

    echo -e "\nEnter the tarball to be extracted :\n"
    read filenames

# Taking the path as input where the de-compressed(extracted) files/directories have to be stored. Most of the times, it will be the same directory. Just type . (current directory) for it. Type the full path if otherwise.

    echo -e "\nEnter the path where extracted files have to be stored :\n"
    read path

# Finally, bringing all those input parameters together and putting them into the final command and executing it.

    tar -xzvf $filenames.tar.gz -C $path

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"
