@echo off & color 0a
:start
@echo off
adb shell rm -rf /mnt/udisk/map /mnt/udisk/tmp
if %errorlevel% == 0 ( echo /mnt/udisk/map del successfully ) else ( echo /mnt/udisk/map del failed)
adb shell sync

timeout 2
adb shell reboot
echo �������������һ̨����
pause
goto :start
