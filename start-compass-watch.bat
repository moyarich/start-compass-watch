@echo off
echo --PURPOSE / Description
echo _________________________________________________________
echo -- The purpose of this script is to call "compass watch"
echo -- "compass watch" Compiles Sass stylesheets to CSS when they change
echo -- If the config.rb file and this script are in the same folder the 
echo -- script will call compass watch. If they are not in the same folder,
echo -- the script will look 1 directory above it's folder for the config.rb file.
echo _________________________________________________________ && echo.

REM -Because we cannot set a variable inside of an if statement,
REM -we will use ( cd /d .. ) to move to the directory directly above the folder this script file is located in
REM -doing so will automatically capture the name of the parent folder into the dos variable %CD% , %CD% will be used later in this script.
REM - for ex. script file is stored in  c:\users\moya\appz
REM - when we change directory %CD%  will be assigned  c:\users\moya\

cd /d ..

REM The drive letter and path in which that script file is located
set sassfilelocation= %~dp0

echo. && echo This file is located in the directory below:
echo %sassfilelocation%


IF EXIST %sassfilelocation%config.rb (
CALL :strMessage
echo %sassfilelocation% && echo.
cd /d %sassfilelocation%
compass watch

pause
)ELSE (
    IF EXIST  "config.rb" (
      CALL :strMessage
      echo %CD%
      compass watch
      pause
     )else (
         echo. && echo config.rb not found in any of the directories below :
         echo %sassfilelocation%
         echo  %cd%
         pause
     )
)

:strMessage
 echo. && echo The config.rb file is located in the directory below:
:: End of strMessage subroutine
GOTO :EOF