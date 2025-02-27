#!/bin/bash
# EidolonOS: Self-erasing RAM-based OS Boot Script

echo "[*] Initializing EidolonOS RAM environment..."
mount -t tmpfs -o size=2G tmpfs /mnt/ramdisk

echo "[*] Running OS entirely in memory..."
mount --bind /mnt/ramdisk /var/tmp
mount --bind /mnt/ramdisk /home
mount --bind /mnt/ramdisk /root

echo "[*] Disabling swap and persistent storage..."
swapoff -a
rm -rf /var/log/*
rm -rf /tmp/*

echo "[*] Randomizing system identifiers to avoid detection..."
hostname "eidolon-$(head -c 8 /dev/urandom | base64)"

echo "[*] EidolonOS is now active. All traces will vanish upon shutdown."
