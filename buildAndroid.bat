@echo off

cls
pushd %~dp0

pushd tools\scripts\

call common_config.bat

set CONFIG=%1
set JAVAOPTIONS=%2
set COMMIT=%3
set REVERT_CONFIG=%4
set PACK=%5

call %CONFIG_GENERATED%

pushd %ANDROID_BUILD_PATH%

set BUILD_FAILED=0
call %ANDROID_BUILD_SCRIPT_PATH%\build.bat

if errorlevel 1 (
	set BUILD_FAILED=1
	goto :end
)

:end

popd

if "%REVERT_CONFIG%"=="revertconfig" (
	echo.
	svn revert %CONFIG_GENERATED%
	svn revert %CONFIG_HEADER_GENERATED%
	svn revert %PY_CONFIG_GENERATED%
	svn revert %CLASS_LIST_INL_PATH%
)

popd

echo.

if "%BUILD_FAILED%" == "1" (
	start "" "%ANDROID_FRAMEWORK_TOOLS_PATH%notifu\notifu.exe" /m "Build Android failed!" /t error /p "%PROJECT_NAME%" /q /d 5
	pause
	exit /B 1
) else (
	start "" "%ANDROID_FRAMEWORK_TOOLS_PATH%notifu\notifu.exe" /m "Build Android done." /t info /p "%PROJECT_NAME%" /q /d 5
	pause
)