#!/bin/bash
#This script is executed when the device boots up and will keep looping.

#30 second wait time to give other services time to start up when the device boots up.
sleep 30

#Infinite loop:  check every 30 seconds if device is connected to KasadakaNet. If not connected, check if KasadakaNet is in range.
# If it's not in range, wait 30 seconds. If it is in range, restart networking service. This restart will re-raise the network interface, which also triggers any post-up scripts defined in /etc/network/interfaces 

while true; do
	if iwconfig wlan0 | grep -q "KasadakaNet" ; then
		echo "connected to KasadakaNet"
		sleep 30
	else
		echo "scanning for KasadanaNet..."
		if iwlist wlan0 scanning | grep -q "KasadakaNet" ; then
			echo "Found KasadakaNet, reconnecting..."
			service networking restart
			sleep 10
		else
			sleep 30
		fi
	fi
done
