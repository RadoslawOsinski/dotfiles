#!/bin/bash
ifconfig eth0 down;
#ifconfig eth0 hw ether 00:00:00:00:00:07;
ifconfig eth0 hw ether 00:A0:D1:6E:E3:16;
ifconfig eth0 up;
