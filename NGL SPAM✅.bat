@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title NGL Spammer Pro - STAN Edition
color 0a
mode con: cols=70 lines=30

:: Display ASCII Art Header
echo.
echo  ███╗   ██╗ ██████╗ ██╗         ███████╗██████╗  █████╗ ███╗   ███╗
echo  ████╗  ██║██╔════╝ ██║         ██╔════╝██╔══██╗██╔══██╗████╗ ████║
echo  ██╔██╗ ██║██║  ███╗██║         ███████╗██████╔╝███████║██╔████╔██║
echo  ██║╚██╗██║██║   ██║██║         ╚════██║██╔═══╝ ██╔══██║██║╚██╔╝██║
echo  ██║ ╚████║╚██████╔╝███████╗    ███████║██║     ██║  ██║██║ ╚═╝ ██║
echo  ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝    ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝
echo.

:: Default Configuration
set "target=hesyu_santeyo1"
set "message=tite"
set "total=5"
set "min_delay=2"
set "max_delay=10"
set "use_proxy=0"
set "proxy_address="

:main_menu
cls
echo.
echo  ███╗   ██╗ ██████╗ ██╗         ███████╗██████╗  █████╗ ███╗   ███╗
echo  ████╗  ██║██╔════╝ ██║         ██╔════╝██╔══██╗██╔══██╗████╗ ████║
echo  ██╔██╗ ██║██║  ███╗██║         ███████╗██████╔╝███████║██╔████╔██║
echo  ██║╚██╗██║██║   ██║██║         ╚════██║██╔═══╝ ██╔══██║██║╚██╔╝██║
echo  ██║ ╚████║╚██████╔╝███████╗    ███████║██║     ██║  ██║██║ ╚═╝ ██║
echo  ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝    ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝
echo.
echo  ==============================
echo           BY: DWATA
echo  ==============================
echo.
echo  1. Start Spamming
echo  2. Change Target / use username (!target!)
echo  3. Change Message (!message!)
echo  4. Set Message Count (!total!)
echo  5. Set Delays (!min_delay!-!max_delay!s)
echo  6. Proxy Settings
echo  7. Test Connection
echo  8. Exit
echo.
set /p "menu_choice=Select Option: "

if "!menu_choice!"=="1" goto start_spam
if "!menu_choice!"=="2" goto change_target
if "!menu_choice!"=="3" goto change_message
if "!menu_choice!"=="4" goto change_count
if "!menu_choice!"=="5" goto change_delays
if "!menu_choice!"=="6" goto proxy_menu
if "!menu_choice!"=="7" goto test_connection
if "!menu_choice!"=="8" exit
goto main_menu

:change_target
cls
echo.
echo Current Target: !target!
echo.
set /p "target=Enter New Target: "
goto main_menu

:change_message
cls
echo.
echo Current Message: !message!
echo.
set /p "message=Enter New Message: "
goto main_menu

:change_count
cls
echo.
echo Current Message Count: !total!
echo.
set /p "total=Enter New Count: "
goto main_menu

:change_delays
cls
echo.
echo Current Delays: !min_delay!-!max_delay! seconds
echo.
set /p "min_delay=Enter Minimum Delay: "
set /p "max_delay=Enter Maximum Delay: "
goto main_menu

:proxy_menu
cls
echo.
echo Current Proxy: 
if "!use_proxy!"=="1" (
    echo Enabled: !proxy_address!
) else (
    echo Disabled
)
echo.
set /p "use_proxy=Enable Proxy? (1=Yes, 0=No): "
if "!use_proxy!"=="1" (
    set /p "proxy_address=Enter Proxy (IP:Port): "
)
goto main_menu

:test_connection
cls
echo.
echo Testing connection to NGL...
echo.
curl -I "https://ngl.link/!target!"
echo.
pause
goto main_menu

:start_spam
cls
echo.
echo  ===== SPAMMING CONFIGURATION =====
echo  Target: !target!
echo  Message: "!message!"
echo  Message Count: !total!
echo  Delays: !min_delay!-!max_delay! seconds
if "!use_proxy!"=="1" (
    echo  Proxy: !proxy_address!
) else (
    echo  Proxy: Disabled
)
echo.
echo  [!] Press CTRL+C to cancel
echo.
pause

:: Verify curl
where curl >nul 2>&1
if errorlevel 1 (
    echo ERROR: Install curl first from:
    echo https://curl.se/windows/
    pause
    exit /b
)

echo.
echo Starting spam attack...
echo.

for /l %%i in (1,1,!total!) do (
    set /a "delay=!min_delay! + !random! %% (!max_delay! - !min_delay! + 1)"
    
    echo [Message %%i/!total!] Sending to !target!...
    
    if "!use_proxy!"=="1" (
        curl -x "!proxy_address!" -X POST "https://ngl.link/api/submit" ^
        -H "authority: ngl.link" ^
        -H "accept: application/json" ^
        -H "content-type: application/x-www-form-urlencoded" ^
        -H "origin: https://ngl.link" ^
        -H "referer: https://ngl.link/!target!" ^
        -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/!random!.0.0.0 Safari/537.36" ^
        --data-raw "username=!target!&question=!message!&deviceId=!random!!random!&gameSlug=&referrer="
    ) else (
        curl -X POST "https://ngl.link/api/submit" ^
        -H "authority: ngl.link" ^
        -H "accept: application/json" ^
        -H "content-type: application/x-www-form-urlencoded" ^
        -H "origin: https://ngl.link" ^
        -H "referer: https://ngl.link/!target!" ^
        -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/!random!.0.0.0 Safari/537.36" ^
        --data-raw "username=!target!&question=!message!&deviceId=!random!!random!&gameSlug=&referrer="
    )
    
    if %%i lss !total! (
        echo Waiting !delay! seconds...
        timeout /t !delay! >nul
    )
)

echo.
echo  ===== SPAMMING COMPLETE =====
echo  Check messages at: https://ngl.link/!target!
echo  Note: May take 5-15 minutes to appear
pause
goto main_menu