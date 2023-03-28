#!/bin/bash

if [ "$1" == "" ]; then
    echo -e "[i] Agrega una dirección ip.\nexample: ./pinger.sh <ipaddress>"
    exit 1
fi

ip_introducida=$(echo $1 | sed 's/\.[0-9]*$/\./')

for ip in `seq 1 254`; do
    ping -c 1 $ip_introducida$ip | grep "64 bytes" | cut -d " " -f4 | tr -d ":"  &
done;wait
