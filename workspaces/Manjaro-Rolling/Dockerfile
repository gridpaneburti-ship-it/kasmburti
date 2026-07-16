FROM manjarolinux/base:latest

LABEL maintainer="gridpaneburti"
LABEL org.opencontainers.image.title="Kasm Workspace - Manjaro KDE Plasma"
LABEL org.opencontainers.image.description="Manjaro Rolling with KDE Plasma desktop environment for Kasm Workspaces"

ENV KASM_VNC_PORT=5901 \
    KASM_RDP_PORT=3389 \
    DISPLAY=:1 \
    HOME=/home/kasm-user

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    plasma-desktop \
    konsole \
    dolphin \
    tigervnc \
    xorg-server-xvfb \
    novnc \
    python-websockify \
    dbus \
    mesa-utils \
    alsa-utils \
    ttf-dejavu \
    ttf-liberation \
    curl \
    wget \
    ca-certificates \
    sudo

RUN useradd -m -d /home/kasm-user -s /bin/bash kasm-user && \
    mkdir -p /home/kasm-user/.vnc && \
    echo "Nospe86842020!!!" | vncpasswd -f > /home/kasm-user/.vnc/passwd && \
    chmod 600 /home/kasm-user/.vnc/passwd && \
    chown -R kasm-user:kasm-user /home/kasm-user

COPY --chown=kasm-user:kasm-user start-kde.sh /home/kasm-user/
RUN chmod +x /home/kasm-user/start-kde.sh

USER kasm-user
WORKDIR /home/kasm-user
EXPOSE 5901 3389 8080
CMD ["/home/kasm-user/start-kde.sh"]
