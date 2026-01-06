@echo off
title Lag Fix (FlushDNS)
cls
color a
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
pause
shutdown /r /t 0