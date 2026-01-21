#!/bin/bash

echo "=============================="
echo " Linux Health Check Report"
echo " Hostname: $(hostname)"
echo " Date: $(date)"
echo "=============================="

echo ""
echo "Uptime:"
uptime

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -m
