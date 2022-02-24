#!/bin/bash

# sh -c 'id proxy'

# 1. IPv4:
# Accept all requests coming from e2guardian's (localhost) 8080 port 
sudo iptables -A INPUT -j ACCEPT -m comment --comment "E2guardian" -s 127.0.0.1 -p tcp --dport 8080
# Reject all 80/443 requests not coming from process squid
# TODO: try add other ports here? Especially ones required for logging into EE wifi for first time (requires acces through a port ask4.com:567?)
sudo iptables -I OUTPUT -p tcp -m owner ! --uid-owner 65534 -m multiport --dports http,https -j REJECT -m comment --comment "Force e2guardian"

# 2. IPv6:
sudo ip6tables -A INPUT -j ACCEPT -m comment --comment "E2guardian" -s ::1 -p tcp --dport 8080
sudo ip6tables -I OUTPUT -p tcp -m owner ! --uid-owner 65534 -m multiport --dports http,https -j REJECT -m comment --comment "Force e2guardian"

# 3. Save iptables: (change on ubuntu)
sudo iptables-save -f /etc/iptables/iptables.rules
sudo ip6tables-save -f /etc/iptables/ip6tables.rules

sudo systemctl enable e2guardian

sudo iptables  -vnL --line-numbers
sudo iptables  -vnL --line-numbers -t nat
sudo ip6tables -vnL --line-numbers

