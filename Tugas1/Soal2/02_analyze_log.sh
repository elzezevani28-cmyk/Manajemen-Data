#!/bin/bash

LOGFILE="user_activity.log"
REPORT="daily_report.txt"
ALERT="alert.log"

# Cek file log
if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File log tidak ditemukan."
    exit 1
fi

# Cek file kosong
if [ ! -s "$LOGFILE" ]; then
    echo "ERROR: File log kosong."
    exit 1
fi

TODAY=$(date +"%Y-%m-%d")

FAILED_LOGIN=$(grep "^$TODAY" "$LOGFILE" | grep "ACTION=login" | grep "STATUS=FAILED" | wc -l)

UPLOAD_SUCCESS=$(grep "^$TODAY" "$LOGFILE" | grep "ACTION=upload" | grep "STATUS=SUCCESS" | wc -l)

TOPUSER=$(grep "^$TODAY" "$LOGFILE" | grep -o "USER=[^|]*" | cut -d= -f2 | sort | uniq -c | sort -rn | head -3)

echo "==================================" > "$REPORT"
echo "DAILY ACTIVITY REPORT" >> "$REPORT"
echo "Tanggal : $TODAY" >> "$REPORT"
echo "==================================" >> "$REPORT"
echo "Login gagal : $FAILED_LOGIN" >> "$REPORT"
echo "Upload sukses : $UPLOAD_SUCCESS" >> "$REPORT"
echo "" >> "$REPORT"
echo "Top 3 user paling aktif :" >> "$REPORT"
echo "$TOPUSER" >> "$REPORT"

if [ "$FAILED_LOGIN" -gt 10 ]; then
    echo "$(date) ALERT: Login gagal lebih dari 10 kali." >> "$ALERT"
fi

echo "Analisis selesai."
