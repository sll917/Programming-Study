@echo off
chcp 65001 > nul
echo [1/6] 终止并禁用所有更新相关服务...
net stop wuauserv > nul 2>&1
sc config wuauserv start=disabled > nul
net stop UsoSvc > nul 2>&1
sc config UsoSvc start=disabled > nul
net stop WaaSMedicSvc > nul 2>&1
sc config WaaSMedicSvc start=disabled > nul

echo [2/6] 写入深度阻断注册表策略...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t REG_DWORD /d 1 /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f > nul
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t REG_DWORD /d 5000 /f > nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f > nul

echo [3/6] 禁用所有更新任务计划...
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Reboot" /Disable > nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Maintenance Install" /Disable > nul 2>&1

echo [4/6] 创建防火墙规则封锁微软更新服务器...
netsh advfirewall firewall add rule name="永久阻断Windows更新" dir=out action=block service=any description="封锁Microsoft更新服务器" remoteip=157.56.106.189,52.184.216.174,40.77.226.250 enable=yes > nul

echo [5/6] 锁定系统更新组件权限...
icacls "C:\Windows\SoftwareDistribution" /inheritance:d /grant:r Everyone:(OI)(CI)F /t /c > nul
icacls "C:\Windows\System32\wuaueng.dll" /deny Everyone:(RX) > nul

echo [6/6] 清理并重启生效...
shutdown /r /t 10 /c "系统即将重启以完成更新禁用配置！"
echo 所有操作已完成！系统将在10秒后自动重启...
pause
