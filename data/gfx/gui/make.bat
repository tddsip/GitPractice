
@echo off
setlocal enabledelayedexpansion

REM DIRECTORY, WHERE DATA THAT NEED TO BE PACKED, MUST BE COPIED
set DIR_TO_PACK=%1

REM DIRECTORY, WHERE DATA WHICH DON'T NEED TO BE PACKED, MUST BE COPIED
set DIR_NOT_TO_PACKED=%2

REM DIRECTORY, WHERE TO SOURCE FILES MUST BE COPIED
set DIR_SOURCE=%3

rem --- gui sprites
echo ...building gui sprites...
cd sprites
call make.bat %1 %2 %3
cd ..

rem --- gui splash
echo ...building gui splash...
cd splash
call make.bat %1 %2 %3
cd ..

rem --- .Game stuff
echo ...building gui game file...
cd game
%TOOLS_PATH%\AuroraGT\AuroraGT.exe "gui.gamecmd"
for %%i in (*.layers) do copy %%i %DIR_TO_PACK%\gui_%%i > NUL
cd ..
	
:end
endlocal