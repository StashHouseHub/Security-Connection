FirewallPro
---------------
__Run as Administrator__  

For any missing modules use "pip" to install them through your terminal. Modules that's known to be missing:
pip install InquirerPy | pip install psutil | pip install tk | pip install colorama

Functions:
* Shows Firewall status and profiles
* Scans common local IPs, broadcasts, and mDNS for potenial attacks every 100 entries

  _Highly suggest learning about ports and their functions. Learn the difference between normal "chatter" and a real potenial attack when using the FirewallPro_

Security-Tool
-----------------
__Run as Administrator__
* Used to improve network security and gaming latency

* Closes ports such as SMB 445, RPC 135, SNMP 161 and 162, TFTP 69, SOCKS 1080, NetBIOS 137 and 139

* Flushes DNS then reboots system for changes that require as reboot


__PORTS TO NEVER BLOCK:__

_Port 53 (DNS): Outbound only; keep inbound blocked_

_Ports 80 and 443 (HTTP/HTTPS): Critical for web browsing and game downloads_

_Ports 3074 and 3478 (Xbox Live/PlayStation Network): Required for online gaming_

_Ports 6000-7000: Many modern games use dynamic ports in this range_

FlushDNS
------------
__Run as Administrator__
* Removes all cached DNS entries on your machine, including both successful and failed lookups, forcing new queries to DNS servers
  
* Ensures you get updated IP information if a site’s address has changed, instead of your device using an old, wrong record

* Clears potentially corrupted or tampered DNS cache data that could be causing errors or redirecting you incorrectly
  
* Improve privacy slightly by wiping local DNS history that reveals what domains you’ve recently visited
