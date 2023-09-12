#!/usr/bin/bash

# This bash script is used to store 'n' number of iterations of the top command to a text file. Both the number of iterations and the file in which the data has to be stored will be taken by the user as input.

# Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

# Entry message.

    echo -e "\n###Preparing to examine your system###\n"

# Taking the number of iterations as input.

    echo -e "\nEnter the number of iterations to perform :\n"
    read iterations

# Taking filename(path) where all the data will be stored.

    echo -e "\nEnter the filename(or path of file) to store the data or create a new one:\n"
    read filename

# Check if the file exists.

if [ -f "$filename" ]; then

# Asking the user to wait for the iterations to finish

    echo -e "\nPlease wait for the iterations to finish.\nDuration will depend on the number of iterations you have entered.\n"

# Finally, bringing all the input parametres together and putting them into the command and executing it.

    top -b -n $iterations > $filename

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"

else

# Create the text file if it doesn't exist already.

    touch $filename.txt

# Asking the user to wait for the iterations to finish

    echo -e "\nPlease wait for the iterations to finish.\n\nDuration depends upon the number of iterations entered.\n"

# Finally, bringing all the input parametres together and putting them into the command and executing it.

    top -b -n $iterations > $filename.txt

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"

fi
