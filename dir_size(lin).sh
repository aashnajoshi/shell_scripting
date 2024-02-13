#!/bin/bash

# Prompt the user for the folder location
read -p "Enter the path of the folder you want to analyze: " directory_path

# Check if a directory path is provided
if [ -z "$directory_path" ]; then
    echo "Error: No directory path provided."
    exit 1
fi

# Check if the provided directory exists
if [ ! -d "$directory_path" ]; then
    echo "Error: Directory '$directory_path' does not exist."
    exit 1
fi

# Display the current directory
echo "Current directory: $directory_path"
echo

# Initialize total number of files and subdirectories
file_count=0
folder_count=0
prev_directory=""

# Process files and count subdirectories
find "$directory_path" -type f -exec bash -c '
    # Extract the directory of the current file
    current_directory=$(dirname "$1")

    # If the current directory is different from the previous one, print it
    if [ "$current_directory" != "$prev_directory" ]; then
        echo "."
        echo "cwd: $current_directory"
        echo "."
        prev_directory="$current_directory"
        folder_count=$((folder_count + 1))
    fi

    # Print file information
    echo "File: $(basename "$1") - Size: $(stat -c %s "$1") bytes"
    file_count=$((file_count + 1))
' bash {} \;

# Display the total number of files and subdirectories
echo
echo "Total number of files: $file_count"
echo "Total number of subdirectories: $folder_count"

exit 0
