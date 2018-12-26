@echo off
setlocal enabledelayedexpansion

echo ...BUILDING MATH TABLE...

REM DIRECTORY, WHERE DATA THAT NEED TO BE PACKED, MUST BE COPIED
set DIR_TO_PACK=%1

REM DIRECTORY, WHERE DATA WHICH DON'T NEED TO BE PACKED, MUST BE COPIED
set DIR_NOT_TO_PACKED=%2

REM DIRECTORY, WHERE TO SOURCE FILES MUST BE COPIED
set DIR_SOURCE=%3

rem --- if math table does not exist, create those
	if not exist COS.ARRAY (
		echo.
		echo ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
		echo   math table are missing
		echo      configure and use _master_data\math\buildMathTable.bat 
		echo      to build those first
		echo ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
		echo.
	)

rem --- copy all table to DIR_TO_PACK
	copy *.ARRAY "%DIR_TO_PACK%" > nul

endlocal