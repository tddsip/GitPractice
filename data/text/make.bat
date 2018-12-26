@echo off

rem check the environment is correct
if E%CORE_PATH%==E exit 10

rem check parameter number
if E%1==E exit 87

set ODS2MNT_EXE=%CORE_PATH%\..\..\Monolith\bin\ODS2MNT.exe

echo [%CD%]
rem be really really carefull here
pushd %MASTER_DATA%\text
if not "%ERRORLEVEL%"=="0" (
    echo ... WARNING: target folder does not exit
    echo ... SKIPPING
    echo.>%1.mnt
    exit 0
)
echo [%CD%]

set _CMD_="%ODS2MNT_EXE%" %1
echo %_CMD_%
call %_CMD_%
if not "%ERRORLEVEL%"=="0" exit %ERRORLEVEL%

popd

exit %ERRORLEVEL%
