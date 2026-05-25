#!/bin/bash
# Network Monitor Script
# Written by Moeez
# Scans network and shows all connected devices

echo "======================================="
echo "        Network Monitor by Moeez"
echo "======================================="
echo ""

# Get your own IP address
my_ip=$(hostname -I | awk '{print $1}')
echo "Your IP Address : $my_ip"

# Get your network range
network=$(echo $my_ip | cut -d'.' -f1-3)
echo "Scanning Network: $network.0/24"
echo ""
echo "======================================="
echo "Scanning for connected devices..."
echo "======================================="
echo ""

# Create results file
results_file=~/cloud_lab/network_results.txt
echo "Network Scan Results - $(date)" > $results_file
echo "=======================================" >> $results_file

# Counter for found devices
found=0

# Scan all IPs from 1 to 254
for i in $(seq 1 254)
do
    ip="$network.$i"
    
    # Ping each IP — 1 packet, 1 second timeout
    ping -c 1 -W 1 $ip > /dev/null 2>&1
    
    if [ $? -eq 0 ]
    then
        # Device is online!
        hostname=$(nslookup $ip 2>/dev/null | grep 'name = ' | awk '{print $4}')
        
        if [ -z "$hostname" ]
        then
            hostname="Unknown device"
        fi
        
        echo "✓ ONLINE  | IP: $ip | Device: $hostname"
        echo "ONLINE | IP: $ip | Device: $hostname" >> $results_file
        found=$((found + 1))
    fi
done

echo ""
echo "======================================="
echo "Scan Complete!"
echo "Total devices found: $found"
echo "Results saved to: $results_file"
echo "======================================="
