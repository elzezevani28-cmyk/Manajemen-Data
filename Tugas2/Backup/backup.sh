#!/bin/bash

SOURCE="$HOME/Documents/Manajemen Data/tugas demo uts/Tugas2"
DEST="$HOME/backup"

# Membuat folder backup jika belum ada
mkdir -p "$DEST"

# Melakukan backup
cp -r "$SOURCE" "$DEST"

echo "================================="
echo "Backup berhasil dilakukan!"
echo "Lokasi backup : $DEST"
echo "================================="

# Menampilkan isi folder backup
ls -l "$DEST"
