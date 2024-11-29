:: certutil -hashfile ÎÄ¼şÃû SHA1

@echo off & color 0a
:sll

@echo on & color 0a
::ÍÆËÍÉı¼¶°üµ½»úÆ÷ÈË/tmp
adb push Upgrade*.zip /tmp

@echo off & color 0a
adb shell sync
if %errorlevel% == 0 ( 
echo push file successfully 
) else ( 
echo push file failed
)

::timeout 1
@echo on & color 0a
::ÖØÃüÃûÉı¼¶°üÎÄ¼ş
adb shell mv /tmp/Upgrade*.zip /tmp/upgrade.zip

@echo off & color 0a
adb shell sync
set T=%time:~0,-6%
set mark=%T::=%
::echo %mark%

if %mark% lss 1000 (
set Updatetime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~1,1%:%time:~3,2%
) else (
set Updatetime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%
)
echo %Updatetime% >> Upgrade.log
 
@echo on & color 0a
::Ö´ĞĞOTAÉı¼¶½Å±¾
adb shell ./mnt/res/app/preUpgrade.sh

@echo off & color 0a
echo [91mÇëÈ·ÈÏ»úÆ÷Éı¼¶³É¹¦(dockºÍcleanµÆ²»ÉÁË¸),ÔÙ°´ÈÎÒâ¼ü¿É¶ÁÈ¡°æ±¾ĞÅÏ¢[0m
pause

::¸üĞÂÔö¼ÓÉı¼¶¼ÇÂ¼
color 0a
::adb shell ifconfig | grep HWaddr | awk '{print $5}'
adb shell ifconfig 
adb shell ifconfig >> Upgrade.log
adb shell cat /mnt/res/vapp/AC.conf
adb shell cat /mnt/res/vapp/AC.conf >> Upgrade.log
adb shell cat /mnt/res/app/wifi_channel_plan.config
adb shell cat /mnt/res/app/wifi_channel_plan.config >> Upgrade.log
adb shell cat /tmp/AppInfo.txt
adb shell cat /tmp/AppInfo.txt >> Upgrade.log

echo [91mÔÙ°´ÈÎÒâ¼ü»áÖØĞÂÉı¼¶,Çë¸ü»»ÏÂÒ»Ì¨»úÆ÷¼ÌĞøÉı¼¶. [0m
pause

goto sll
