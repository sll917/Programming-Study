@echo off & color 0a
:start
::Updated on 2024-01-18
set T=%time:~0,-6%
set mark=%T::=%
::echo %mark%

if %mark% lss 1000 (
set logtime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~1,1%%time:~3,2%
) else (
set logtime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~0,2%%time:~3,2%
)

mkdir %logtime%_log
adb pull /tmp/ .\%logtime%_log\tmp
adb pull /mnt/ .\%logtime%_log\mnt
if %errorlevel% == 0 (
echo pull log successfully 
) else ( 
echo pull log failed
)
timeout 1
::start /max /wait "" "%CD%"
start /wait "" "%CD%"


::以下是压缩功能
::cd 
::powershell -command "Compress-Archive -Path %cd%\%logtime%_log -DestinationPath %cd%\%logtime%_log.zip"
::if %errorlevel% == 0 ( echo compressed file successfully ) else ( echo compressed file failed)

::echo "按任意键重新拉取log"
::pause
::goto :start
