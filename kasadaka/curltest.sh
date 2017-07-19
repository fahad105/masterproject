#!/bin/bash
set -x

#Note: This file is not used in the final version of the DonkeyBox
/usr/bin/curl -F "upfile=@/etc/network/localdatastore.txt" 192.168.77.1:8080 >> /etc/network/curllog.txt
echo "uploaded file ----------" >> /etc/network/connectionlog.txt
/usr/bin/curl 192.168.77.1/Shared/syncedfile.txt >> /etc/network/remotedatastore.txt
echo "retrieved file from pibox ---------" >> /etc/network/connectionlog.txt
