@echo off

cls

pushd %~dp0
pushd tools\scripts\buildWin\

call win_build.bat %1 %2 %3 %4

popd

:end