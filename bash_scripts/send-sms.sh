#This script is used to send an sms to your mobile phone using KDEConnect-cli commands

# Sample command which includes my phone name, device ID and phone number
# kdeconnect-cli --name "GARVIT" --device "5445b41dd643282d" --send-sms="Hello" --destination=8810253985

#Define function for name
name() {
#Take device name as input and store in variable 'name'
echo -e "\nEnter device name : \n"
read name
}

#Define function for ID
DeviceID(){
#Take Device ID as input and store in variable 'id'
echo -e "\nEnter Device ID : \n"
read id
}

#Define function for mobile number
mobile() {
#Take mobile number to be used and store in variable 'mnumber'
echo -e "\nEnter the mobile number : \n"
read mnumber
}

#Define function for message
message(){
#Take the message as input and store in variable 'message'
echo -e "\nEnter your message\n"
read message
echo -e "\n"
}

#Define function that runs the command
run(){
kdeconnect-cli --name "$name" --device "$id" --send-sms="$message" --destination=$mnumber
}

#Define main function
main(){
name
DeviceID
mobile
message
run
}

#Run the main function
main
