#!/bin/bash

# Note: if error: sudo: unable to resolve host userEl: Temporary failure in name resolution
# add to /etc/hosts 127.0.0.1 userEL

# reset settings
sudo iptables --flush
sudo iptables --flush -t nat
sudo ip6tables --flush

# set default policies to DROP (if no ACCEPT is matched, the policy is applied, matching is done one by one from top, once ACCEPT is matched in a chain, no more rules are matched)
sudo iptables -P FORWARD DROP
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP

# block all ipv6 connections
sudo ip6tables -P FORWARD DROP
sudo ip6tables -P INPUT DROP # ACCEPT
sudo ip6tables -P OUTPUT DROP # ACCEPT

sudo iptables -A INPUT  -j ACCEPT -i lo -m comment --comment "loopback" # interprocess communication
sudo iptables -A OUTPUT -j ACCEPT -o lo -m comment --comment "loopback"

sudo iptables -A INPUT  -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack" # packets that are part of an existing connection
sudo iptables -A OUTPUT -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"

#sudo iptables -A INPUT -j ACCEPT -p icmp --icmp-type 8 -m comment --comment "PING" # ping my machine from my network
#sudo iptables -A INPUT -j ACCEPT -p tcp --dport 22 -m comment --comment "SSH" # ssh into my machine from my network

# this works (block any domain containing 'porn'); take the rest from wechat. dashes '-' work okay

# to block dots, use [bannedregexpurllist] in e2guardian. (use transparent proxy)
#sudo iptables -A OUTPUT -j DROP -m string --string ".love" --algo kmp # dots '.' don't get blocked. this is a redundant rule
#sudo iptables -A OUTPUT -j DROP -m string --string ".video" --algo kmp # same
#sudo iptables -A OUTPUT -j DROP -m string --string ".watch" --algo kmp # same

# you can put all of these in [bannedregexpurllist]

sudo iptables -A OUTPUT -j DROP -m string --string "asian" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "adult" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "babe" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "beast" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "bitch" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "blonde" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "club" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "d-serv" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "dating" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "eroti" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "escort" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "freetube" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "galore" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "gay" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "girl" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "gratis" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "hardco" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "japanese" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "jav" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "jerk" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "hott" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "juicy" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "lust" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mature" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mobi" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mommy" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "secretar" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "seducti" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "seks" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sesso" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sex" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "pimp" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "pics" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "picture" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "panty" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "slut" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sleaz" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "softcore" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "teen" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "taboo" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "webcam" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "woman" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "women" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "xyz" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "young" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "секс" --algo kmp # does not work, how to fix?

sudo iptables -A OUTPUT -j ACCEPT -p icmp --icmp-type 8 -m comment --comment "PING"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 22    -m comment --comment "Secure SHell" # gitlab pushing. sharq connection
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 80    -m comment --comment "HTTP"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 443   -m comment --comment "HTTP/SSL (HTTPS)"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 21    -m comment --comment "FTP"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 53    -m comment --comment "DNS/TCP" # DNS address lookup over TCP/UDP
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 53    -m comment --comment "DNS/UDP"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 123   -m comment --comment "NTP" # synchronising time with internet
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 5037  -m comment --comment "ADB"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 143  -m comment --comment "IMAP"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 993  -m comment --comment "IMAP/SSL"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 25   -m comment --comment "SMTP"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 26   -m comment --comment "SMTP 2nd"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 465  -m comment --comment "SMTP/SSL"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 587  -m comment --comment "Thunderbird port" # does not make a difference.

#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 67   -m comment --comment "DHCP/src" # I don't know what these are for.
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 68   -m comment --comment "DHCP/dst"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 110  -m comment --comment "POP3"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 500   -m comment --comment "VPNC" # connecting to the university vpn
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 4500  -m comment --comment "VPNC"

sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 5938  -m comment --comment "teamviewer"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 5938  -m comment --comment "teamviewer"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 443   -m comment --comment "Google Meet" # https://support.google.com/a/answer/1279090
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19302 -m comment --comment "Google Meet" # --match multiport --dports 19302:19309 (does not work)
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19303 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19304 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19305 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19306 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19307 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19308 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19309 -m comment --comment "Google Meet"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8801 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8802 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8803 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8804 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8805 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8806 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8807 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8808 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8809 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8810 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 3478 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 3479 -m comment --comment "zoom"

sudo iptables -A INPUT -j LOG --log-prefix "elias_in:" --log-level 6 # LOG is a non-terminating rule
sudo iptables -A OUTPUT -j LOG --log-prefix "elias_out:" --log-level 6

# ipv6: (copied from above)
sudo ip6tables -A INPUT  -j ACCEPT -i lo -m comment --comment "loopback"
sudo ip6tables -A OUTPUT -j ACCEPT -o lo -m comment --comment "loopback"
sudo ip6tables -A INPUT  -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"
sudo ip6tables -A OUTPUT -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"
#sudo ip6tables -A INPUT -p icmpv6 -j ACCEPT # ipmpv6 are essential for ipv6
#sudo ip6tables -A OUTPUT -p icmpv6 -j ACCEPT # or ipv6-icmp
sudo ip6tables -A OUTPUT -j ACCEPT -p tcp --dport 5037 -m comment --comment "ADB" # needed for connecting android adb
sudo ip6tables -A OUTPUT -j ACCEPT -p tcp --dport 22   -m comment --comment "SSH secure shell" # needed for ssh
sudo ip6tables -A OUTPUT -j ACCEPT -p udp --dport 123  -m comment --comment "NTP" # synchronising time with internet

sudo ip6tables -A INPUT -j LOG --log-prefix "elias_in_ipv6:" --log-level 6
sudo ip6tables -A OUTPUT -j LOG --log-prefix "elias_out_ipv6:" --log-level 6

# save settings: (change on ubuntu)
# ubuntu: sudo apt-get install iptables-persistent
#         sudo dpkg-reconfigure iptables-persistent
#         sudo iptables-save | sudo tee /etc/iptables/rules.v4
#         sudo ip6tables-save | sudo tee /etc/iptables/rules.v6
#         reboot
#         https://askubuntu.com/a/1379914
sudo iptables-save  -f /etc/iptables/iptables.rules
sudo ip6tables-save -f /etc/iptables/ip6tables.rules

# enable auto running after system restart
systemctl enable iptables.service
systemctl enable ip6tables.service

# display settings
sudo iptables  -vnL --line-numbers
sudo iptables  -vnL --line-numbers -t nat
sudo ip6tables -vnL --line-numbers

# note: to remove a rule, replace -A with -D
