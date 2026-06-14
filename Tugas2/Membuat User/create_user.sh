#!/bin/bash

INPUT="users.txt"

while read user
do
    sudo useradd -m "$user"
    echo "$user:create123" | sudo chpasswd
    echo "User $user berhasil dibuat."
done < "$INPUT"
