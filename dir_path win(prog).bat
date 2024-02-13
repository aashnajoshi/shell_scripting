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

:menu
REM Display options for the current directory
echo.
echo Currently in directory: %directory_path%
echo.

REM List files in the current directory
echo Files in %directory_path%:
for %%F in ("%directory_path%\*") do (
    if "%%~aF" neq "d" (
        echo   File: %%~nxF - Size: %%~zF bytes
    )
)

echo.
echo [1] Navigate to a subfolder
echo [2] Back to parent directory
echo [0] Exit
echo.

REM Prompt user for choice
set /p "choice=Enter your choice: "

REM Process user choice
if "%choice%"=="1" goto navigate_subfolder
if "%choice%"=="2" goto back_to_parent
if "%choice%"=="0" exit

REM Invalid choice
echo Invalid choice. Please try again.
pause
goto menu

:navigate_subfolder
REM Navigate to a subfolder
set /a "option=1"
set "subfolder_path_list="
set "counter=0"
for /d %%D in ("%directory_path%\*") do (
    set /a "counter+=1"
    echo [!option!] %%~nxD
    set "subfolder_path_list=!subfolder_path_list!%%~fD|"
    set /a "option+=1"
)
echo.
set /p "subfolder_choice=Enter the number of the subfolder you want to navigate into (or 0 to cancel): "
if "%subfolder_choice%"=="0" goto menu
set "found=false"
for /f "tokens=1,* delims=|" %%a in ("%subfolder_path_list%") do (
    if !counter! equ %subfolder_choice% (
        set "subfolder_path=%%a"
        set "found=true"
        goto navigate_to_subfolder
    )
    set /a "counter-=1"
)
if not %found%==true (
    echo Invalid subfolder choice. Please try again.
    pause
    goto navigate_subfolder
)

:navigate_to_subfolder
if not exist "%subfolder_path%" (
    echo Subfolder does not exist. Please try again.
    pause
    goto navigate_subfolder
)
pushd "%subfolder_path%"
set "directory_path=%CD%"
goto menu

:back_to_parent
REM Back to parent directory
popd
set "directory_path=%CD%"
goto menu
