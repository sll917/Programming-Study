:: certutil -hashfile �ļ��� SHA1

@echo off & color 0a
:sll

@echo on & color 0a
::������������������/tmp
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
::�������������ļ�
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
::ִ��OTA�����ű�
adb shell ./mnt/res/app/preUpgrade.sh

@echo off & color 0a
echo [91m��ȷ�ϻ��������ɹ�(dock��clean�Ʋ���˸),�ٰ�������ɶ�ȡ�汾��Ϣ[0m
pause

::��������������¼
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

echo [91m�ٰ����������������,�������һ̨������������. [0m
pause

goto sll
