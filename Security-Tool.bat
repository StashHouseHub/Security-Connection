@echo off
color a
title Security Tool v0.7
cls
echo -------------------------------------------------------------
echo This script tightens security and boosts gaming performace
echo Created by $tash House
echo -------------------------------------------------------------
echo PORTS TO NEVER BLOCK:
echo Port 53 (DNS): Outbound only; keep inbound blocked
echo Ports 80 and 443 (HTTP/HTTPS): Critical for web browsing and game downloads
echo Ports 3074 and 3478 (Xbox Live/PlayStation Network): Required for online gaming
echo Ports 6000-7000: Many modern games use dynamic ports in this range
echo ---------------------------------------------------------------------------------
pause
ipconfig /release
ipconfig /renew
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global ecncapability=disabled
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
netsh advfirewall firewall add rule name="Block SMB 445" protocol=TCP dir=in localport=445 action=block
netsh advfirewall firewall add rule name="Block NetBIOS 139" protocol=TCP dir=in localport=139 action=block
netsh advfirewall firewall add rule name="Block NetBIOS 137" protocol=UDP dir=in localport=137 action=block
netsh advfirewall firewall add rule name="Block RPC 135" protocol=TCP dir=in localport=135 action=block
netsh advfirewall firewall add rule name="Block SNMP 161" protocol=UDP dir=in localport=161 action=block
netsh advfirewall firewall add rule name="Block SNMP 162" protocol=UDP dir=in localport=162 action=block
netsh advfirewall firewall add rule name="Block TFTP 69" protocol=UDP dir=in localport=69 action=block
netsh advfirewall firewall add rule name="Block SOCKS 1080" protocol=TCP dir=in localport=1080 action=block
netsh advfirewall firewall add rule name="Block Back Orifice" protocol=TCP dir=in localport=31337 action=block
netsh advfirewall firewall add rule name="Block DiagTrack" dir=out action=block service=DiagTrack
netsh advfirewall firewall add rule name="Block dmwappushservice" dir=out action=block service=dmwappushservice
echo Security Tool complete, review for any errors, then press 'Enter' to restart computer.
pause
shutdown /r /t 0