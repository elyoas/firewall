#!/bin/bash

# Will be disabled until next restart.

sudo iptables  --flush
sudo iptables  --flush -t nat
sudo ip6tables --flush

sudo iptables -P FORWARD ACCEPT
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT

sudo ip6tables -P FORWARD ACCEPT
sudo ip6tables -P INPUT ACCEPT
sudo ip6tables -P OUTPUT ACCEPT

#sudo iptables  -vnL --line-numbers
#sudo iptables  -vnL --line-numbers -t nat
#sudo ip6tables -vnL --line-numbers

