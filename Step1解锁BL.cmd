@echo off  
setlocal enabledelayedexpansion  
COLOR 90
title MI ����bootloader�ű�-��ʼ��
echo ��ʼ��...
echo ��������ļ�
del /s/q 7z.exe
del /s/q 7z.dll
del /s/q adb.exe
del /s/q AdbWinApi.dll
del /s/q AdbWinUsbApi.dll
del /s/q fastboot.exe
del /s/q mi\*
rd /S /Q mi
del /s/q mi.zip
curl -o 7z.dll https://mirror.ghproxy.com/https://raw.githubusercontent.com/0x6768/adb/main/7z.dll
curl -o 7z.exe https://mirror.ghproxy.com/https://raw.githubusercontent.com/0x6768/adb/main/7z.exe
curl -o adb.7z https://mirror.ghproxy.com/https://raw.githubusercontent.com/0x6768/adb/main/adb.7z
7z x adb.7z
del /s/q adb.7z
cls
:confirm  
cls
title MI ����bootloader�ű� 
echo MI ����bootloader�ű�  
echo ======================================  
COLOR 47
echo ���ű����ڽ���С���ֻ���bootloader��  
echo ʹ�ô˽ű�ǰ����ȷ�����˽����bootloader�ķ��գ�  
echo ���������������ݶ�ʧ������ʧЧ�Լ����ܵ��µ��豸��ש��  
echo.
echo ��Ҫ����������  
echo ʹ�ñ��ű�����bootloader���ܵ����豸�𻵻����ݶ�ʧ��  
echo �����߲��е��κ����Ρ�  
echo.
echo ��ֹ���˽ű������κ���ҵ�򸶷Ѱ�ˢ����  
echo.
  
set /p confirmation=�����롰��ֹ���ڸ��Ѱ�ˢ����ȷ�������Ķ���ͬ����������:
  
if /i "!confirmation!" neq "��ֹ���ڸ��Ѱ�ˢ" (  
    echo ����������������нű�����ȷ���롣  
    pause >nul  
    goto confirm  
)  
COLOR 90
cls
echo ���ȿ���adb����:  
echo ���ֻ�����,�����ֻ�-ȫ������  
echo ���MIUI�汾5���Կ���������ѡ��  
echo ���ؿ�����ѡ��,����OEM������USB���ԡ�USB���԰�ȫ����  
echo Ȼ�����豸����״̬,���豸���˺ţ��ر�WiFi��ʹ������������󶨣�  
echo ��ɲ������밴�س���  
pause >nul  
COLOR 90
echo ������������������,ѡ�����ļ�ģʽ  
echo ��ɲ������밴�س���  
pause >nul  
COLOR 90 
adb devices  
if %errorlevel% neq 0 (  
    echo �޷���⵽�豸����ȷ���豸�����ӡ�  
    goto end  
)  
echo �����һ����ʾ���豸��,�������豸�ɹ�  
echo ��ɲ������밴�س���  
pause >nul  
COLOR 90  
adb reboot bootloader  
echo �ֻ�Ӧ�û�������û��߳�ɫFASTBOOT����  
echo �������س�  
pause >nul  
COLOR 00
echo ���ؽ�������  
curl -o mi.zip http://cdn.cnbj1.fds.api.mi-img.com/flash-tool/miflash_unlock_7.6.727.43.zip  
if %errorlevel% neq 0 (  
    echo ����ʧ�ܣ������������Ӳ����ԡ�  
    goto end  
)  
  
echo ��ѹ�ļ�  
7z x mi.zip -o.\mi  
if %errorlevel% neq 0 (  
    echo ��ѹʧ�ܣ���ȷ��7z����ȷ��װ��  
    goto end  
)  
  
echo ����ݽ���������ʾ����,�س�����  
pause >nul  
 
echo ���н�������  
.\mi\miflash_unlock.exe  

:end  

echo ��������ļ�
del /s/q mi\*
rd /S /Q mi
del /s/q 7z.exe
del /s/q 7z.dll
del /s/q adb.exe
del /s/q AdbWinApi.dll
del /s/q AdbWinUsbApi.dll
del /s/q fastboot.exe
echo �ű�ִ����ϡ� 
endlocal