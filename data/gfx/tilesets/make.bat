
@echo off
setlocal enabledelayedexpansion

REM DIRECTORY, WHERE DATA THAT NEED TO BE PACKED, MUST BE COPIED
set DIR_TO_PACK=%1

REM DIRECTORY, WHERE DATA WHICH DON'T NEED TO BE PACKED, MUST BE COPIED
set DIR_NOT_TO_PACKED=%2

REM DIRECTORY, WHERE TO SOURCE FILES MUST BE COPIED
set DIR_SOURCE=%3

rem --- game sprites
echo ...building ingame sprites...
cd sprites
call make.bat %1 %2 %3
cd ..

rem --- .Game stuff
cd game

echo ...building ingame game file...
%TOOLS_PATH%\AuroraGT\AuroraGT.exe "AS3.gamecmd"

echo ...building ingame tilesets...
%TOOLS_PATH%\AuroraGT\AuroraGT.exe "AS3.sprcmd"

	copy /y *.bin "%DIR_TO_PACK%" > NUL
	copy /y *.bsprite "%DIR_TO_PACK%" > NUL
	copy /y *.layers "%DIR_TO_PACK%" > NUL
	copy /y *.cinematics "%DIR_TO_PACK%" > NUL
	cd ..
	
:end
endlocal