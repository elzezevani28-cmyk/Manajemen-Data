#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}')

echo "================================="
echo "Monitoring Hard Disk"
echo "Penggunaan HDD : $usage"
echo "================================="
