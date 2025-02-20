timeout 10
:startjc

tasklist | find /i "qfeelAssemblyProgrammer"

if %errorlevel% == 0 (
		echo .…
)else (
	 start C:\Users\Administrator\Desktop\programStationV1.1.4D\qfeelAssemblyProgrammer.exe
	 
	timeout 15
 )
goto startjc



