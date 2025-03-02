:: certutil -hashfile 文件名 SHA1

@echo off & color 0a
:sll

@echo on & color 0a
::推送升级包到机器人/tmp
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
::重命名升级包文件
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
::执行OTA升级脚本
adb shell ./mnt/res/app/preUpgrade.sh

@echo off & color 0a
echo [91m请确认机器升级成功(dock和clean灯不闪烁),再按任意键可读取版本信息[0m
pause

::更新增加升级记录
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

echo [91m再按任意键会重新升级,请更换下一台机器继续升级. [0m
pause

goto sll
