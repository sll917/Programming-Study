@echo off
:sll
::set logtime=%date:~0,4%_%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%
::mkdir %logtime%_log
@echo on
adb shell touch /mnt/udisk/main_robopad_switch_flag
if %errorlevel% == 0 ( echo robopad �򿪳ɹ�! ) else ( echo robopad ��ʧ��!)
adb shell sync

adb shell reboot
pause
goto sll