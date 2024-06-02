#! /bin/bash
bluetoothctl
power on
pairable on
scan on


# agent on
# default-agent

scan on

# Keychron K3 DC:2C:26:42:03:B2
agent KeyboardOnly
default-agent
trust DC:2C:26:42:03:B2
pair DC:2C:26:42:03:B2
connect DC:2C:26:42:03:B2

# Soundcore Space Q45 E8:EE:CC:AD:97:DA
pair E8:EE:CC:AD:97:DA
connect E8:EE:CC:AD:97:DA

# Soundcore Liberty 4 NC E8:EE:CC:C3:8A:A0
pair E8:EE:CC:C3:8A:A0
connect E8:EE:CC:C3:8A:A0

# Soundcore Liberty 3 Pro E8:EE:CC:22:EC:B4
pair E8:EE:CC:22:EC:B4
connect E8:EE:CC:22:EC:B4

echo Устройства подключены
