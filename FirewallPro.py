import os
import sys
import time
from colorama import init, Fore, Style # type: ignore
import re

log_file = r'C:\Windows\System32\LogFiles\Firewall\pfirewall.log'

# Colors and intro 

init(autoreset=True) #resets colors after print

name = "$tash House"
version = "v0.7"

print()
print(Fore.RED + "Welcome to FirewallPro")
print(Fore.YELLOW + name)
print(Fore.LIGHTCYAN_EX + version)
print()
time.sleep(5)

def print_in_place(msg):
    sys.stdout.write('\r' + ' ' * 20)  # Padding for erasing longer lines
    sys.stdout.flush()

def tail(file, n=20):
    with open(file, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()[-n:]
    return lines

def display_firewall_status():
    print('Firewall status:')
    os.system('netsh advfirewall show allprofiles')
    print(Fore.LIGHTMAGENTA_EX + "Starting Firewall Montioring...")
    time.sleep(5)

def is_local_chatter(line):
    # Regexes for common local IPs, broadcasts, and mDNS
    if re.search(r'224\.0\.0\.\d+|239\.\d+\.\d+\.\d+', line):  # Multicast
        return True
    if re.search(r'255\.255\.255\.255', line):  # Broadcast
        return True
    if re.search(r'\b10\.\d+\.\d+\.\d+\b', line):  # 10.0.0.0/8
        return True
    if re.search(r'\b192\.168\.\d+\.\d+\b', line):  # 192.168.0.0/16
        return True
    if re.search(r'\b172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+\b', line):  # 172.16.0.0/12
        return True
    if ' 5353 ' in line:  # mDNS
        return True
    return False

def display_dropped_filtered():
    if not os.path.exists(log_file):
        print('Firewall log not found or logging is not enabled.')
        return
    dropped = [line for line in tail(log_file, 100) if 'DROP' in line.upper()]
    # Filter out local chatter
    filtered = [line for line in dropped if not is_local_chatter(line)]
    if not filtered:
        print(Fore.LIGHTGREEN_EX + "No possible threats detected in the last 100 entries.")
    else:
        for line in filtered[-10:]:
            print(line.strip())

if __name__ == '__main__':
    display_firewall_status()
    while True:
        display_dropped_filtered()
        time.sleep(5)
