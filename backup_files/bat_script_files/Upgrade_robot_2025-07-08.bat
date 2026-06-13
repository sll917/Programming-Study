:: VER V1.3
:: certutil -hashfile ÎÄ¼şÃû SHA1
::°ÑËûÍÆËÍµ½ adb push update.img /mnt/udisk/ 
::È»ºóadb shell ½øÈ¥Ö´ĞĞ£º updateEngine --image_url=/userdata/update.img --misc=update --savepath=/userdata/update.img --reboot &

::dir Upgrade*.zip > Upgrade.txt
@echo off & color 0a
:sll

::ÍÆËÍÉı¼¶°üµ½»úÆ÷ÈË/tmp
setlocal enabledelayedexpansion

:: ÉèÖÃÄ¿±êÉè±¸´æ´¢Â·¾¶
set TARGET_PATH="/tmp/"

:: ±éÀúµ±Ç°Ä¿Â¼ÏÂËùÓĞUpgrade_*.zipÎÄ¼ş
for %%f in (Upgrade_*.zip) do (
    echo The file is being pushed: %%f
    adb push "%%f" %TARGET_PATH%
    
    :: ÑéÖ¤ÎÄ¼ş´«Êä
    adb shell ls %TARGET_PATH%%%f >nul
    if !errorlevel! equ 0 (
        echo [successfully] %%f push file successfully
    ) else (
        echo [failed] %%f push file failed
    )
)
echo The push operation has been completed

::timeout 1
@echo on & color 0a
::ÖØÃüÃûÉı¼¶°üÎÄ¼ş
adb shell mv /tmp/Upgrade*.zip /tmp/upgrade.zip

@echo off & color 0a
adb shell sync
set T=%time:~0,-6%
set mark=%T::=%
::echo %mark%

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

if %mark% lss 1000 (
set Updatetime=%date:~0,4%_%date:~5,2%%date:~8,2%_%time:~1,1%%time:~3,2%
) else (
set Updatetime=%date:~0,4%_%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%
)
echo %Updatetime% >> Upgrade.log
 
adb pull /tmp/logmain_log_file000.log .
ren logmain_log_file000.log %Updatetime%.log

echo [91mÔÙ°´ÈÎÒâ¼ü»áÖØĞÂÉı¼¶,Çë¸ü»»ÏÂÒ»Ì¨»úÆ÷¼ÌĞøÉı¼¶. [0m
pause

goto sll

:: VER V1.2
:: certutil -hashfile ÎÄ¼şÃû SHA1
::°ÑËûÍÆËÍµ½ adb push update.img /mnt/udisk/ 
::È»ºóadb shell ½øÈ¥Ö´ĞĞ£º updateEngine --image_url=/userdata/update.img --misc=update --savepath=/userdata/update.img --reboot &
 
::@echo off & color 0a
:::sll

::@echo on & color 0a
::ÍÆËÍÉı¼¶°üµ½»úÆ÷ÈË/tmp
::adb push Upgrade*.zip /tmp

::@echo off & color 0a
::adb shell sync
::if %errorlevel% == 0 ( 
::echo push file successfully 
::) else ( 
::echo push file failed
::)

::timeout 1
::@echo on & color 0a
::ÖØÃüÃûÉı¼¶°üÎÄ¼ş
::adb shell mv /tmp/Upgrade*.zip /tmp/upgrade.zip

::@echo off & color 0a
::adb shell sync
::set T=%time:~0,-6%
::set mark=%T::=%
::echo %mark%

::@echo on & color 0a
::Ö´ĞĞOTAÉı¼¶½Å±¾
::adb shell ./mnt/res/app/preUpgrade.sh

::@echo off & color 0a
::echo [91mÇëÈ·ÈÏ»úÆ÷Éı¼¶³É¹¦(dockºÍcleanµÆ²»ÉÁË¸),ÔÙ°´ÈÎÒâ¼ü¿É¶ÁÈ¡°æ±¾ĞÅÏ¢[0m
::pause

::¸üĞÂÔö¼ÓÉı¼¶¼ÇÂ¼
::color 0a
::adb shell ifconfig | grep HWaddr | awk '{print $5}'
::adb shell ifconfig 
::adb shell ifconfig >> Upgrade.log
::adb shell cat /mnt/res/vapp/AC.conf
::adb shell cat /mnt/res/vapp/AC.conf >> Upgrade.log
::adb shell cat /mnt/res/app/wifi_channel_plan.config
::adb shell cat /mnt/res/app/wifi_channel_plan.config >> Upgrade.log
::adb shell cat /tmp/AppInfo.txt
::adb shell cat /tmp/AppInfo.txt >> Upgrade.log

::if %mark% lss 1000 (
::set Updatetime=%date:~0,4%_%date:~5,2%%date:~8,2%_%time:~1,1%%time:~3,2%
::) else (
::set Updatetime=%date:~0,4%_%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%
::)
::echo %Updatetime% >> Upgrade.log
 
::adb pull /tmp/logmain_log_file000.log .
::ren logmain_log_file000.log %Updatetime%.log

::echo [91mÔÙ°´ÈÎÒâ¼ü»áÖØĞÂÉı¼¶,Çë¸ü»»ÏÂÒ»Ì¨»úÆ÷¼ÌĞøÉı¼¶. [0m
::pause

::goto sll

::=============================================================
:: VER V1.1
:: certutil -hashfile ÎÄ¼şÃû SHA1

::@echo off & color 0a
:::sll

::@echo on & color 0a
::ÍÆËÍÉı¼¶°üµ½»úÆ÷ÈË/tmp
::adb push Upgrade*.zip /tmp

::@echo off & color 0a
::adb shell sync
::if %errorlevel% == 0 ( 
::echo push file successfully 
::) else ( 
::echo push file failed
::)

::timeout 1
::@echo on & color 0a
::ÖØÃüÃûÉı¼¶°üÎÄ¼ş
::adb shell mv /tmp/Upgrade*.zip /tmp/upgrade.zip

::@echo off & color 0a
::adb shell sync
::set T=%time:~0,-6%
::set mark=%T::=%
::echo %mark%

::if %mark% lss 1000 (
::set Updatetime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~1,1%:%time:~3,2%
::) else (
::set Updatetime=%date:~0,4%_%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%
::)
::echo %Updatetime% >> Upgrade.log
 
::@echo on & color 0a
::Ö´ĞĞOTAÉı¼¶½Å±¾
::adb shell ./mnt/res/app/preUpgrade.sh

::@echo off & color 0a
::echo [91mÇëÈ·ÈÏ»úÆ÷Éı¼¶³É¹¦(dockºÍcleanµÆ²»ÉÁË¸),ÔÙ°´ÈÎÒâ¼ü¿É¶ÁÈ¡°æ±¾ĞÅÏ¢[0m
::pause

::¸üĞÂÔö¼ÓÉı¼¶¼ÇÂ¼
::color 0a
::adb shell ifconfig | grep HWaddr | awk '{print $5}'
::adb shell ifconfig 
::adb shell ifconfig >> Upgrade.log
::adb shell cat /mnt/res/vapp/AC.conf
::adb shell cat /mnt/res/vapp/AC.conf >> Upgrade.log
::adb shell cat /mnt/res/app/wifi_channel_plan.config
::adb shell cat /mnt/res/app/wifi_channel_plan.config >> Upgrade.log
::adb shell cat /tmp/AppInfo.txt
::adb shell cat /tmp/AppInfo.txt >> Upgrade.log

::echo [91mÔÙ°´ÈÎÒâ¼ü»áÖØĞÂÉı¼¶,Çë¸ü»»ÏÂÒ»Ì¨»úÆ÷¼ÌĞøÉı¼¶. [0m
::pause

::goto sll

