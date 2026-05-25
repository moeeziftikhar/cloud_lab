#!/bin/bash
# System Health Check Script
# This checks disk space and RAM and warns if low

echo "================================"
echo "     System Health Check"
echo "================================"

# Check disk space
echo ""
echo "--- Disk Space ---"
df -h

# Check RAM
echo ""
echo "--- Memory Usage ---"
free -h

# Check disk usage percentage
disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

echo ""
echo "--- Health Status ---"
if [ $disk_usage -gt 80 ]
then
    echo "WARNING: Disk is ${disk_usage}% full — clean up needed!"
else
    echo "OK: Disk usage is ${disk_usage}% — healthy"
fi

echo ""
echo "Health check complete!"
echo "================================"
