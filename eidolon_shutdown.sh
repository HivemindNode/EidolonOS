#!/bin/bash
# EidolonOS Self-Erasing Shutdown Script

echo "[*] Wiping RAM-resident files..."
shred -u /var/tmp/*
shred -u /home/*
shred -u /root/*
shred -u /tmp/*

echo "[*] Securely overwriting memory regions..."
sync; echo 3 > /proc/sys/vm/drop_caches

echo "[*] EidolonOS has been erased. This system never existed."
poweroff
