#!/bin/bash
set -x

op="${1:-op}"
mac="${2:-mac}"
ip="${3:-ip}"
hostname="${4}"

echo "${op} | ${mac} | ${ip} | ${hostname}" >> /opt/piratebox/tmp/dhcpchanges.txt
if [[ ${op} = "add" || ${op} = "old" ]] ; then
	QUERY=$(cat /home/pi/kasadakanet/query.txt)
	mkdir -m 777 -p /home/pi/kasadakanet/results/${mac}
	/usr/bin/curl ${ip}:3020/sparql/ --data-urlencode "query=${QUERY}" > /home/pi/kasadakanet/results/${mac}/queryresult.rdf
	echo "ran query on ${ip}" >> /opt/piratebox/tmp/dhcpchanges.txt
fi



