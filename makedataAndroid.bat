@echo off
pushd %~dp0

pushd tools\scripts\
call common_config.bat
call %CONFIG_GENERATED%
popd

set GAMETYPED_CMD=gametyped
set GAME_TYPE_DEPENDANT=0
if "%1"=="%GAMETYPED_CMD%" (
	set GAME_TYPE_DEPENDANT=1
) else (
	if "%2"=="%GAMETYPED_CMD%" set GAME_TYPE_DEPENDANT=1
)

set PACK_CMD=pack
if "%GAME_TYPE_DEPENDANT%"=="1" (
	if "%GAME_TYPE_STR%"=="Premium" (
		set PACK_CMD=packbundle
	)
)

call makedata.bat %1 %PACK_CMD%