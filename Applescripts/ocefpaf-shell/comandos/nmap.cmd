# info on open ports
nmap -sV 192.168.0.3

# search OS
nmap -O 192.168.0.4

# more info
nmap -vv host.target.com

# stealth mode 
nmap -sS 192.168.0.1-254

# UDP ports
nmap -sU 192.168.0.4

# full port scan
nmap -sS -p 0-65535 192.168.0.4

# port 22543 only
nmap -sV -p 22543 192.168.0.4
