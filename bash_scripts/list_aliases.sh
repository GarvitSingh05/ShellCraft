#!/usr/bin/bash

# Initiase the .zshrc filename to variable named file

    file=.zshrc

# Check if the .zshrc file exists or not

    if [ -e "$file" ]; then

# Initialise the path to .zshrc(or .bashrc) file which is the configuration file for aliases.

    path=/home/garvits/.zshrc #Modify this path according to your system

# Check how many lines in the .zshrc file contain the keyword 'alias' in it.

    total_number=$(grep -c "alias" /home/garvits/.zshrc)

# Subtract 6 from it as the .zshrc file naturally contains 6 lines which contain the keyword 'alias', but they are just for documentation and are commented for this reason. The total number minus 6 will give us the number of aliases the user has created.

    real_number=`expr $total_number - 6`

# Run the final command

    grep -rA $real_number "#List of Aliases" $path
    echo -e "\n"

 else

     echo -e "\n.zshrc configuration doesnt exist/path cannot be found. Try running the bash script in the Home Directory or change the path manually in the script"

 fi
