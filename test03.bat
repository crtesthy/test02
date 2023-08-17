rem @echo off

rem ZIP�`���ň��k����t�H���_(�܂��̓t�@�C��)�p�X���w��
set targetPath=%USERPROFILE%\Desktop
rem ��(�W�J)��t�H���_���w��
set zipFilePath=%TEMP%\data.zip

rem ���s����PowerShell�̃R�}���h���b�g��g�ݗ���
set psCommand=powershell -NoProfile -ExecutionPolicy Unrestricted Compress-Archive -Path %targetPath% -DestinationPath %zipFilePath% -Force

rem PowerShell�̃R�}���h���b�g�����s
%psCommand%

setlocal

:: FTP�T�[�o�[�̏��
set "ftp_server=192.168.211.140"
set "ftp_username=test01"
set "ftp_password=P@ssw0rd"

:: �A�b�v���[�h�Ώۃt�@�C���ƃ��[�J���̈ꎞ�f�B���N�g��
set "local_file=%TEMP%\data.zip"
set "target_file=data_%COMPUTERNAME%.zip"

:: FTP�R�}���h���L�q�����ꎞ�X�N���v�g�t�@�C��
set "ftp_script=%TEMP%\ftp_script.txt"

(
echo open %ftp_server%
echo %ftp_username%
echo %ftp_password%
echo binary
echo put "%local_file%" "%target_file%"
echo quit
) > %ftp_script%

:: FTP�R�}���h�̎��s
ftp -s:%ftp_script%

:: �ꎞ�X�N���v�g�t�@�C���̍폜
del %ftp_script%

endlocal
