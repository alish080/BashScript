#!/bin/bash

ram_threshold_high=60
ram_threshold_mod=30

disk_threshold_high=50
disk_threshold_mod=30

current_ram=$(free -m | awk '/Mem:/ {print int($3/$2*100)}')
current_disk=$(df -k / | awk 'NR==2 {print int($3/$2*100)}')

echo "Ram usage of your system: ${current_ram}%"

if [ "$current_ram" -gt "$ram_threshold_high" ]; then
	echo "Alert: RAM usage is critically high at ${current_ram}%!!!"
elif [ "$current_ram" -gt "$ram_threshold_mod" ]; then 
	echo "Your ram usage is ${current_ram}% which is moderate, you are just multitasking (: (:"
else
	echo "RAM uasge is low at ${current_ram}%, nice"
fi

echo "Disk usage of your system is: ${current_disk}%"
if [ "$current_disk" -gt "$disk_threshold_high" ]; then
	echo "Disk usage is critically high, at ${current_disk}%!!!"
elif [ "$current_disk" -gt "$disk_threshold_mod" ]; then
	echo "Disk is  ${current_disk}% which is moderate, you are just multitasking (: (:"
else
	echo "Disk usage is low at ${current_disk}%, nice"
fi

threshold_high=60
threshold_mod=20

cpu_usage=$(top -bn2 -d 0.5 | grep "%Cpu(s)"| tail -n 1 | awk '{print int(100-$8)}') 
echo "CPU Load : ${cpu_usage}% used"

if [ "$cpu_usage" -gt "$threshold_high" ]; then 
	echo "Cpu load is high, working hard i see or maybe your system is crashing (: (:"
elif [ "$cpu_usage" -gt "$threshold_mod" ]; then 
	echo "Cpu load is moderate at ${cpu_usage}% "
else 
	echo "Your cpu load is fine as ${cpu_usage}% is low, less power usage and system stays cools "
fi

