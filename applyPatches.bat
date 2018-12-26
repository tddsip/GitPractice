@echo off

cls
pushd %~dp0

if "%1%"=="auto" goto patching

echo.
set ANSWER=n
set /p ANSWER=Apply all patches. Are you sure (y/n): 

if not "%ANSWER%"=="y" if not "%ANSWER%"=="Y" goto quit

:patching

pushd .
cd patches
call apply_patches_with_revert.bat
popd

:quit
echo nothing to do here
echo this line: nothing to do here too