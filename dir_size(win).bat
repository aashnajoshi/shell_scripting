@echo off
setlocal EnableDelayedExpansion

REM Prompt the user for the folder location
set /p "directory_path=Enter the path of the folder you want to analyze: "

REM Check if a directory path is provided
if "%directory_path%" == "" (
    echo Error: No directory path provided.
    exit /b 1
)

REM Check if the provided directory exists
if not exist "%directory_path%" (
    echo Error: Directory '%directory_path%' does not exist.
    exit /b 1
)

REM Display the current directory
echo Current directory: %directory_path%
echo.

REM Initialize total number of files and subdirectories
set "file_count=0"
set "folder_count=0"
set "prev_directory="

REM Process files and count subdirectories
for /r "%directory_path%" %%A in (*) do (
    if "%%~dpA" neq "!prev_directory!" (
        REM Print the current directory path
        echo.
        echo cwd: %%~dpA
        REM Print separator line
        echo .
        REM Update the previous directory
        set "prev_directory=%%~dpA"
        REM Increment folder count
        set /a "folder_count+=1"
    )
    REM Increment file count
    set /a "file_count+=1"
    REM Print file information
    echo File: %%~nxA - Size: %%~zA bytes
)

REM Display the total number of files and subdirectories
echo.
echo Total number of files: %file_count%
echo Total number of subdirectories: %folder_count%

pause
exit /b
