#!/usr/bin/bash

# This bash script is used to resize(or reduce the size of) the images in a directory ALL at once.

# Initiliase a timer to calculate the runtime of the script.

    Start=$(date +%s.%N)

# Take the source directory and target directory as input from the user

    echo -e "\nEnter source directory : \n"
    read src_dir

    echo -e "\nEnter target directory or enter a path to create a new one : \n"
    read target_dir

# Take the desired image size as input from the user.

    echo -e "\nEnter desired Width of image : \n"
    read width

    echo -e "\nEnter desired Height of image : \n"
    read height

# Check if the target directory already exists or not. If not, then create a new directory in the else block of code first and then proceed with the regular code of image resizing.

if [ -d "$target_dir" ]; then

# Loop through all image files in the source directory

for file in "$src_dir"/*.{jpg,jpeg,png,gif}; do

# Check if the file is a regular file

if [[ -f "$file" ]]; then

# Extract the filenames and extension. Here we want to resize all the images in that directory at once.

    filename="${file##*/}"
    extension="${filename##*.}"

# Construct the target file path

    target_file="$target_dir/${filename%.*}_resized.$extension"

# Resize or convert the image using ImageMagick

    convert "$file" -resize "${width}x${height}" "$target_file"

# Print a message indicating the progress

    echo -e "\nProcessed: $file -> $target_file"

fi

done

    echo -e "\nImage resizing/conversion complete!"

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"


else

# Create the target directory if it doesn't exist

    mkdir -p "$target_dir"

for file in "$src_dir"/*.{jpg,jpeg,png,gif}; do

# Check if the file is a regular file

if [[ -f "$file" ]]; then

# Extract the filename and extension

    filename="${file##*/}"
    extension="${filename##*.}"

# Construct the target file path

    target_file="$target_dir/${filename%.*}_resized.$extension"

# Resize or convert the image using ImageMagick

    convert "$file" -resize "${width}x${height}" "$target_file"

# Print a message indicating the progress

    echo -e "\nProcessed: $file -> $target_file"

fi

done

    echo -e "\nImage resizing/conversion complete!"

# Stop the timer initialised at the beginning and calculate the running duration.

    End=$(date +%s.%N)
    Runtime=$( echo "$End - $Start" | bc -l )

# Write a message of completion including the runtime in seconds.

    echo -e "\n***Bash Script Runtime : $Runtime seconds***\n"

fi




