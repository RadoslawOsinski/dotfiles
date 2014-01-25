#!/bin/bash -v

tunctl -t tap0 -u radek;
brctl addbr br0;
ifconfig eth0 0.0.0.0 promisc;
brctl addif br0 eth0;
dhclient br0;
brctl addif br0 tap0;
ifconfig tap0 up;
chmod 0666 /dev/net/tun;
