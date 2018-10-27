@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\qrlk\Documents\t480-gamemode\T480-gamemode-on.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter v4.09\ab2econv409\icons\icon11.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=1
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=T480 gamemode on
REM BFCPEVERDESC=Enabling gamemode on T480
REM BFCPEVERCOMPANY=T480 users
REM BFCPEVERCOPYRIGHT=qrlk
REM BFCPEOPTIONEND
@ECHO ON
@echo off
powershell -c "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^+{M}')
start cmd /c C:\Windows\devcon.exe remove ACPI\INT3403
timeout 1
start cmd /c C:\Windows\devcon.exe remove ACPI\INT3400
timeout 1
start cmd /c C:\Windows\devcon.exe remove "PCI\VEN_8086&DEV_1903"
timeout 1
start cmd /c C:\Windows\devcon.exe disable "ACPI\VEN_LEN&DEV_0100"
timeout 1
start cmd /c sc stop LITSSVC
timeout 1
start cmd /c sc stop esifsvc
timeout 1
powershell -executionpolicy remotesigned -File C:\Windows\gamemode-on.ps1