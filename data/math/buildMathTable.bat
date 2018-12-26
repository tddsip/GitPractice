@echo off
set JDK_PATH=c:\j2sdk1.4.2_08
set TOOLS_PATH=E:\java\_project\GLLib_sampleapplication\sonyericsson\k800\trunk\_tools

"%JDK_PATH%\bin\java.exe" -classpath "%TOOLS_PATH%\buildMathTable;%TOOLS_PATH%\binArray" BuildMathTable -d . -m 8 -a 8

pause