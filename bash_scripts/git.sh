#!/usr/bin/bash

        #######_**General Instructions**_#######

# 1) Use this script when initialising and pushing changes to a repository for the first time in a new folder.

# 2) You can still use it afterwards, but it will keep showing that remote origin already exists and it will then continue to ask you the commit message.

# 3) The keyword 'main' can be changed if using for other branches.

        #######_**Code + Documentation_**#######

#Initiliase a timer to calculate the runtime of the script in seconds.

    Start=$(date +%s.%N)

#Checking if an empty git repository (.git hidden folder) has already been initialised.

    File=.git

if [ -e "$File" ]; then

#Write a script launch message.

    echo -e "\nInitialising......\n"
    echo -e "Preparing To Run Bash Script... \n 3.... \n 2... \n 1.. \n Good to go! \n"

#Taking Repository Link as Input.

    echo -e "Enter Remote Repository Link : \n"
    read repo_link
    echo -e "\n"

#Putting the Link in the following command.

    git remote add origin $repo_link

#Asking which files are to be staged.

    echo -e "Enter Filenames To Be Added : \n"
    read file_names
    echo -e "\n"

#Putting those filenames in the following command.

    git add $file_names

#Taking commit message as input.

    echo -e "Enter Commit Message : \n"
    read commit_message
    echo -e "\n"

#Putting that commit message in the following command.

    git commit -m "$commit_message"

#Finally pushing the changes.

    git push origin main

#Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

#Write a message of completion including the runtime in seconds.

    echo -e "\n\n***Task Completed Successfully in $Runtime seconds***\n\n"

else

#Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

#Write a script launch message.

    echo -e "\nInitialising......\n"
    echo -e "Preparing To Run Bash Script... \n 3.... \n 2... \n 1.. \n Good to go! \n"

#Initialising an empty git repository.

    git init

#Taking repository link as Input.

    echo -e "Enter Repository Link : \n"
    read repo_link
    echo -e "\n"

#Putting that repository link in the following command.

    git remote add origin $repo_link

#Taking filenames which are to be brought upon the staging area so that the changes can be pushed.

    echo -e "Enter The Files To Be Added : \n"
    read file_names
    echo -e "\n"

#Putting those filenames in the following command.

    git add $file_names

#Taking commit message as input.

    echo -e "Enter Commit Message : \n"
    read commit_message
    echo -e "\n"

#Putting that commit message in the following command.

    git commit -m "$commit_message"

#Finally pushing the changes.

    git push origin main

#Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo -e "$End - $Start" | bc -l )

#Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"

fi
