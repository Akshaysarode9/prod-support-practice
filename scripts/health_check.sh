#!/bin/bash

# ----------------------------
# Linux Health Check Script
# Production Support Practice
# ----------------------------

# Log file path
LOG_FILE="$PWD/logs/health_check_$(date +%Y%m%d).log"

# Ensure logs directory exists
mkdir -p logs

# Start logging
{
echo "=============================="
echo " Linux Health Check Report"
echo " Hostname: $(hostname)"
echo " Date: $(date)"
echo "=============================="

echo ""
echo "Uptime:"
uptime || echo "Uptime command not available"

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -m || echo "Free command not available"

echo ""
echo "Health check completed."
echo "------------------------------"

} >> "$LOG_FILE" 2>&1

# Optional alert simulation
# You can add an alert if disk usage > 80%
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -ge 80 ]; then
    echo "ALERT: Disk usage is ${DISK_USAGE}%!" >> "$LOG_FILE"
fi

echo "Health check logged to $LOG_FILE"

