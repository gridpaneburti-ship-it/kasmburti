#!/bin/bash
set -e
echo "Iniciando servicios para KDE Plasma en Manjaro..."

# Arrancar D-Bus
mkdir -p /run/dbus
dbus-daemon --system --fork

export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/share:/usr/local/share

# Iniciar VNC server
vncserver :1 -geometry 1920x1080 -depth 24 -localhost no
sleep 2

echo "Arrancando KDE Plasma desktop..."
startplasma-x11 &

echo "Arrancando WebSocket proxy en puerto 8080..."
nohup python -m websockify --web /usr/share/novnc/ 8080 localhost:5901 > /dev/null 2>&1 &

echo "✅ KDE Plasma Workspace (Manjaro) listo - VNC:5901 | noVNC:8080"
tail -f /dev/null
