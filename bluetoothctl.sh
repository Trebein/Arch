#! /bin/bash
bluetoothctl
default-agent
power on
scan on

# Keychron K3 DC:2C:26:42:03:B2
pair E8:EE:CC:AD:97:DA
connect E8:EE:CC:AD:97:DA

# Soundcore Space Q45 E8:EE:CC:AD:97:DA
pair E8:EE:CC:AD:97:DA
connect E8:EE:CC:AD:97:DA

# Soundcore Liberty 3 Pro E8:EE:CC:22:EC:B4
pair E8:EE:CC:22:EC:B4
connect E8:EE:CC:22:EC:B4

echo Устройства подключены
