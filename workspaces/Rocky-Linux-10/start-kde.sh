#!/bin/bash

set -e

echo "Starting KDE Plasma for Rocky Linux 10..."

mkdir -p /run/dbus
dbus-daemon --system --fork

export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/share:/usr/local/share

vncserver :1 -geometry 1920x1080 -depth 24 -localhost no
sleep 2

startplasma-x11 &

websockify --web /usr/share/novnc/ 8080 localhost:5901 &

echo "KDE Plasma ready: VNC:5901 | noVNC:8080"
tail -f /dev/null