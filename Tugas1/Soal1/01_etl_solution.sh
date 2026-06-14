#!/bin/bash

# Nama file
INPUT="transactions.txt"
OUTPUT="processed_transactions.log"
ERRORLOG="error.log"

# Cek apakah file input ada
if [ ! -f "$INPUT" ]; then
    echo "$(date) - ERROR: File transactions.txt tidak ditemukan." >> "$ERRORLOG"
    exit 1
fi

# Cek apakah file kosong
if [ ! -s "$INPUT" ]; then
    echo "$(date) - ERROR: File transactions.txt kosong." >> "$ERRORLOG"
    exit 1
fi

# Hapus isi output lama agar tidak duplikasi
> "$OUTPUT"

# Transformasi menjadi huruf besar dan filter transaksi >100000
awk -F',' '$2 > 100000' "$INPUT" | tr '[:lower:]' '[:upper:]' > "$OUTPUT"

# Catat log berhasil
echo "$(date) - ETL berhasil dijalankan." >> "$ERRORLOG"
