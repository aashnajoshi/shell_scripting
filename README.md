# Directory Analyzer Scripts

This repository contains scripts for analyzing directory contents on Windows and Linux platforms. The scripts allow users to view files, count files and subdirectories, and navigate through directories.

## Contents

- **dir_size(win).bat**: Basic Windows Batch Script
- **dir_size(upgrade).bat**: Upgraded Windows Batch Script with Navigation
- **dir_size(lin).sh**: Linux Bash Script for Directory Analysis

## Features

### dir_size(win).bat
- Prompts the user for a directory path.
- Counts and lists files in the specified directory.
- Displays the total number of files and subdirectories.
- Simple error handling for empty input and non-existent directories.

### dir_size(upgrade).bat
- Similar functionality to above file but includes:
  - A navigation menu to move into subdirectories or return to the parent directory.
  - A user-friendly interface for listing files and directories.
  - Enhanced error handling for user choices.

### dir_size(lin).sh
- Prompts the user for a directory path.
- Counts and lists files, similar to Code1.bat.
- Compatible with Linux systems.
- Utilizes `find` to recursively list files and manage output.

## Usage

### Windows
1. Download the desired `.bat` file.
2. Run the script by double-clicking or executing it in the Command Prompt.
3. Follow the prompts to enter the directory path.

### Linux
1. Download `dir_size(lin).sh`.
2. Make the script executable with the command:
 ```bash
   chmod +x dir_size(lin).sh
```  
