@echo off

cls
pushd %~dp0

pushd tools\scripts\
call common_config.bat
popd

if %ERRORLEVEL% neq 0 (
	goto end
)

rem check SVN
echo used tools:
echo ------------
echo|set /p="SVN with command line tools: "
call svn --version --quiet
if %ERRORLEVEL% neq 0 (
	goto end
)

rem check Python
call python -V
if %ERRORLEVEL% neq 0 (
	goto end
)

rem check Lua
call lua -v
if %ERRORLEVEL% neq 0 (
	goto end
)

rem check Java
call java -version
if %ERRORLEVEL% neq 0 (
	goto end
)

echo ------------
echo.

set GET_REVISION=1
set arg1=%1
if "%1" neq "" (
	@setlocal enableextensions enabledelayedexpansion
	if not x%arg1:-=%==x!arg1! (
		endlocal
		set GET_REVISION=0
	) else (
		endlocal
	)
)

setlocal enabledelayedexpansion
if %GET_REVISION% neq 0 (
	echo Getting revision, please wait
	call tools\scripts\get_revision.bat nopause updateheader
	if !ERRORLEVEL! neq 0 (
		goto end
	)

	echo.
)

pushd tools\scripts\buildData
lua makedata.lua %1 %2
popd

:end

echo.

call tools\scripts\notify.bat "Make data done." "Make data failed!"
set FAILED=0
if %ERRORLEVEL% neq 0 (
	%CECHO% {red}SCRIPT FAILED! Please check error information carefully, fix and run script again.{#}
	echo.
	echo.
	set FAILED=1
)

if not "%3"=="nopause" (
pause
)

if "%FAILED%" == "1" (
	exit /B 1
)