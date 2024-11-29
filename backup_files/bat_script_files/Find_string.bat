@echo off & color 0a
:sll
set input=
set /p input=请输入需要查找的字符串:
findstr /s /i /n /r "%input%" *.csv
findstr /s /i /n /r "%input%" *.xls
findstr /s /i /n /r "%input%" *.xlsx
findstr /s /i /n /r "%input%" *.log
findstr /s /i /n /r "%input%" *.txt
if %errorlevel% == 0 ( 
echo Find matching characters 
) else ( 
echo No matching characters found
)
pause
goto sll
