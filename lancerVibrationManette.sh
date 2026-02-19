#!/bin/bash
modprobe xpad
event=$(cat /proc/bus/input/devices)   
event=$(echo $event | grep -oE 'Name="Microsoft X-Box One S pad"(.|\n)*(js0\d*)')
event=$(echo $event | grep -oe 'event[0-9]*')
event=/dev/input/$(echo $event)
echo $event

yes "5" | fftest $(echo $event) | sleep 1 | exit