#!/usr/bin/bash

# Ask for choice between PING and Speedtest-cli

echo -e "\nMake a choice - Ping OR Speedtest-cli | Enter p for Ping and s for speedtest-cli\n"
read choice

if [ $choice == p ] || [ $choice == P ]; then

# Display entry message

    echo -e "\nUsing Ping command for network connectivity test.....\n"

# Take website  URL as input

    echo -e "\nEnter website/server URL : \n"
    read website

# Take number of packets as input

    echo -e "\nEnter number of packets : \n"
    read packets
    echo -e "\n"

# Put them all in the command

    ping -c $packets $website
    echo -e "\n"

# If somehow, the URL is invalid

if [ $? != 0 ]; then

    echo `date +%F`
    echo -e "\nYour site seems to be down\n"

fi

elif [ $choice == s ] || [ $choice == S ]; then

# Display entry message

    echo -e "\nUsing speedtest-cli for network connectivity test.....\n"
    echo -e "Please wait...\n"

# Create a text file to store the information

    touch results.txt

#Run the command

    speedtest-cli --simple > results.txt

# Extract the results. awk command is used for getting only the numerical values of upload, download, ping etc.

    download_speed=$(grep "Download" results.txt | awk '{print $2}')
    upload_speed=$(grep "Upload" results.txt | awk '{print $2}')
    ping=$(grep "Ping" results.txt | awk '{print $2}')

# Display the results

    echo "***Results***"
    echo "Download speed: $download_speed mbps"
    echo "Upload speed: $upload_speed mbps"
    echo -e "Ping: $ping ms\n"

#Clean up the temporary file

    rm -f results.txt

else

    #In  case user enters anything other than p, P, s or S as the choice.
     echo -e "\nPlease enter an appropriate choice\n"

fi
