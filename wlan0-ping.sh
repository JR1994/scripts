#!/bin/bash

ping -q -c 3 192.168.254.1 > /dev/null

if [ $? -ne 0 ]
then
	systemctl restart wpa_supplicant@wlan0.service
	sleep 3
	ping -q -c 3 192.168.254.1 > /dev/null
	if [ $? -ne 0 ]
	then
		dhcpd wlan0
	fi
fi

exit
