@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\qrlk\Desktop\qq.exe
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=1
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND
@ECHO ON
@echo off
start cmd /c C:\Windows\devcon.exe rescan
start cmd /k C:\Windows\devcon.exe enable "ACPI\VEN_LEN&DEV_0100"
start cmd /c sc start LITSSVC
start cmd /c sc start esifsvc
powershell -c "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^+{S}')
powershell -c "$xtu_path = 'C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XTUCli.exe';
$status = get-service -name "XTU3SERVICE" | Select-Object {$_.status} | format-wide;
if ($status -ne "Running") { start-service -name "XTU3SERVICE"};
# Undervolt Settings in mV;
& $xtu_path -t -id 34 -v 70;
# Long Boost Settings in Watts;
& $xtu_path -t -id 48 -v 10;
# Short Boost Settings in Watts;
& $xtu_path -t -id 47 -v 25;
# Boost Time Settings in seconds (max 96);
& $xtu_path -t -id 66 -v 28;
stop-process -id $PID -force"