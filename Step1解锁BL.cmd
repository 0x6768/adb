@echo off  
setlocal enabledelayedexpansion  
COLOR 90
title MI 解锁bootloader脚本-初始化
echo 初始化...
echo 清理残留文件
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
title MI 解锁bootloader脚本 
echo MI 解锁bootloader脚本  
echo ======================================  
COLOR 47
echo 本脚本用于解锁小米手机的bootloader。  
echo 使用此脚本前，请确保您了解解锁bootloader的风险，  
echo 包括但不限于数据丢失、保修失效以及可能导致的设备变砖。  
echo.
echo 重要免责声明：  
echo 使用本脚本解锁bootloader可能导致设备损坏或数据丢失，  
echo 开发者不承担任何责任。  
echo.
echo 禁止将此脚本用于任何商业或付费帮刷服务。  
echo.
  
set /p confirmation=请输入“禁止用于付费帮刷”以确认您已阅读并同意上述条款:
  
if /i "!confirmation!" neq "禁止用于付费帮刷" (  
    echo 输入错误，请重新运行脚本并正确输入。  
    pause >nul  
    goto confirm  
)  
COLOR 90
cls
echo 首先开启adb调试:  
echo 打开手机设置,关于手机-全部参数  
echo 点击MIUI版本5次以开启开发者选项  
echo 返回开发者选项,开启OEM解锁、USB调试、USB调试安全设置  
echo 然后点击设备解锁状态,绑定设备与账号（关闭WiFi，使用流量，点击绑定）  
echo 完成操作后请按回车键  
pause >nul  
COLOR 90
echo 请连接数据线至电脑,选择传输文件模式  
echo 完成操作后请按回车键  
pause >nul  
COLOR 90 
adb devices  
if %errorlevel% neq 0 (  
    echo 无法检测到设备，请确保设备已连接。  
    goto end  
)  
echo 如果上一行显示有设备号,则连接设备成功  
echo 完成操作后请按回车键  
pause >nul  
COLOR 90  
adb reboot bootloader  
echo 手机应该会出现米兔或者橙色FASTBOOT界面  
echo 如果是请回车  
pause >nul  
COLOR 00
echo 下载解锁工具  
curl -o mi.zip http://cdn.cnbj1.fds.api.mi-img.com/flash-tool/miflash_unlock_7.6.727.43.zip  
if %errorlevel% neq 0 (  
    echo 下载失败，请检查网络连接并重试。  
    goto end  
)  
  
echo 解压文件  
7z x mi.zip -o.\mi  
if %errorlevel% neq 0 (  
    echo 解压失败，请确保7z已正确安装。  
    goto end  
)  
  
echo 请根据解锁工具提示操作,回车运行  
pause >nul  
 
echo 运行解锁工具  
.\mi\miflash_unlock.exe  

:end  

echo 清理残留文件
del /s/q mi\*
rd /S /Q mi
del /s/q 7z.exe
del /s/q 7z.dll
del /s/q adb.exe
del /s/q AdbWinApi.dll
del /s/q AdbWinUsbApi.dll
del /s/q fastboot.exe
echo 脚本执行完毕。 
endlocal