@echo off
color a
cls
title Download Optimization
REM ============================================
REM Windows Download Speed Optimization Script
REM By: $tashHouse
REM Date: 2026
REM ============================================

REM Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Right-click on this file and select "Run as administrator"
    pause
    exit /b 1
)

cls
echo ============================================
echo Download Speed Optimizer for Windows
echo Created by $tashHouse
echo Version 0.7 Stable
echo ============================================
echo.
echo WARNING: This script modifies network settings.
echo Make sure you have admin rights and are on a stable connection.
echo.
pause

REM Disable Network Heuristics
echo [1/12] Disabling network heuristics...
netsh int tcp set heuristics disabled >nul 2>&1

REM Enable RSS (Receive-Side Scaling)
echo [2/12] Enabling Receive-Side Scaling...
netsh int tcp set global rss=enabled >nul 2>&1

REM Set TCP AutoTuning Level to Normal
echo [3/12] Setting TCP AutoTuning to Normal...
netsh int tcp set global autotuninglevel=normal >nul 2>&1

REM Enable CTCP (Compound TCP) - for faster convergence
echo [4/12] Enabling CTCP for improved congestion control...
netsh int tcp set global congestionprovider=ctcp >nul 2>&1

REM Disable ECN (Explicit Congestion Notification) which can cause issues
echo [5/12] Disabling ECN to prevent compatibility issues...
netsh int tcp set global ecncapability=disabled >nul 2>&1

REM Reset Windows Sockets Catalog
echo [6/12] Resetting Winsock settings...
netsh winsock reset catalog >nul 2>&1

REM Reset TCP/IP stack
echo [7/12] Resetting TCP/IP stack...
netsh int ip reset resetlog.txt >nul 2>&1

REM Flush DNS Cache
echo [8/12] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1

REM Release current IP
echo [9/12] Releasing current IP address...
ipconfig /release >nul 2>&1

REM Wait for IP release
timeout /t 2 /nobreak >nul 2>&1

REM Renew IP address
echo [10/12] Renewing IP address...
ipconfig /renew >nul 2>&1

REM Clear ARP cache
echo [11/12] Clearing ARP cache...
arp -d * >nul 2>&1

REM Optimize MTU (set to 1500 for standard networks)
echo [12/12] Optimizing MTU settings...
for /f "tokens=2" %%A in ('netsh interface ipv4 show interfaces ^| findstr "Connected"') do (
    netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent >nul 2>&1
)

echo.
echo ============================================
echo Optimization Complete!
echo ============================================
echo.
echo Next Steps:
echo 1. Restart your computer for all changes to take effect
echo 2. Test your download speed using Speedtest.net or similar
echo 3. Download a large file and monitor speeds
echo.
echo If speeds don't improve:
echo - Check your internet connection with your ISP
echo - Update network drivers
echo - Try a wired Ethernet connection
echo - Disable VPN/Proxy settings
echo.
pause
