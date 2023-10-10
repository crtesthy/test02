@echo off
set time2=%time: =0%
cd C:\test
echo 111 >C:\test\%time2:~0,2%%time2:~3,2%%time2:~6,2%.txt