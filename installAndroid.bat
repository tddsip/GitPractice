@echo off

cls
pushd %~dp0

pushd tools\scripts\

call common_config.bat

pushd %ANDROID_FRAMEWORK_PATH%

set CONFIG=%1
if "%CONFIG%" == "" (
	set CONFIG=release
)

set ANDROID_FRAMEWORK_DIR=%ANDROID_FRAMEWORK_PATH%
call install.bat %CONFIG%

popd
popd

echo.
pause