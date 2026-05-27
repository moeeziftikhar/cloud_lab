#!/bin/bash
# Network Monitor Pro
# Built by Moeez Iftikhar

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}       Network Monitor Pro              ${NC}"
echo -e "${BLUE}       By Moeez Iftikhar                ${NC}"
echo -e "${BLUE}=========================================${NC}"#!/bin/bash
# =========================================
# Network Monitor Pro
# Built by Moeez Iftikhar
# For Company Network Monitoring
# =========================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Report file
DATE=$(date '+%Y-%m-%d_%H-%M-%S')
REPORT_FILE=~/cloud_lab/reports/report_$DATE.txt

# Create reports folder
mkdir -p ~/cloud_lab/reports

echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}       Network Monitor Pro              ${NC}"
echo -e "${BLUE}       By Moeez Iftikhar                ${NC}"
echo -e "${BLUE}=========================================${NC}"
echo ""

# Ask for network range
echo -e "${YELLOW}Enter network range (example: 172.18.1):${NC}"
read network

echo ""
echo -e "${BLUE}Scanning network: $network.0/24${NC}"
echo -e "${BLUE}Please wait...${NC}"
echo ""

# Save to report
echo "Network Monitor Pro Report" > $REPORT_FILE
echo "Date: $(date)" >> $REPORT_FILE
echo "Network: $network.0/24" >> $REPORT_FILE
echo "=========================================" >> $REPORT_FILE

# Counters
online=0
offline=0

# Scan all IPs
for i in $(seq 1 254)
do
    ip="$network.$i"
    
    # Ping with 1 packet and 1 second timeout
    ping_result=$(ping -c 1 -W 1 $ip 2>/dev/null)
    
    if [ $? -eq 0 ]
    then
        # Get response time
        response_time=$(echo "$ping_result" | grep "time=" | awk -F"time=" '{print $2}' | awk '{print $1}')
        
        echo -e "${GREEN}✓ ONLINE  ${NC}| IP: $ip | Response: ${response_time}ms"
        echo "ONLINE  | IP: $ip | Response: ${response_time}ms" >> $REPORT_FILE
        online=$((online + 1))
    else
        echo -e "${RED}✗ OFFLINE ${NC}| IP: $ip"
        echo "OFFLINE | IP: $ip" >> $REPORT_FILE
        offline=$((offline + 1))
    fi
done

# Summary
echo ""
echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}           SCAN SUMMARY                 ${NC}"
echo -e "${BLUE}=========================================${NC}"
echo -e "${GREEN}Online  devices: $online${NC}"
echo -e "${RED}Offline devices: $offline${NC}"
echo -e "${YELLOW}Total   scanned: $((online + offline))${NC}"
echo -e "${BLUE}=========================================${NC}"
echo -e "Report saved: $REPORT_FILE"
echo -e "${BLUE}=========================================${NC}"

# Save summary to report
echo "" >> $REPORT_FILE
echo "=========================================" >> $REPORT_FILE
echo "SUMMARY" >> $REPORT_FILE
echo "Online  devices: $online" >> $REPORT_FILE
echo "Offline devices: $offline" >> $REPORT_FILE
echo "Total   scanned: $((online + offline))" >> $REPORT_FILE
echo "=========================================" >> $REPORT_FILE
