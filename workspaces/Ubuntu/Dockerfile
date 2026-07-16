FROM ubuntu:22.04

LABEL maintainer="gridpaneburti"
LABEL org.opencontainers.image.title="Kasm Workspace - Ubuntu KDE Plasma"
LABEL org.opencontainers.image.description="Ubuntu 22.04 with KDE Plasma desktop environment for Kasm Workspaces"

ENV DEBIAN_FRONTEND=noninteractive \
    KASM_VNC_PORT=5901 \
    KASM_RDP_PORT=3389 \
    DISPLAY=:1 \
    HOME=/home/kasm-user

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    software-properties-common \
    ca-certificates \
    curl \
    wget \
    gnupg \
    xz-utils \
    kde-plasma-desktop \
    konsole \
    dolphin \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    dialog \
    dbus-x11 \
    tigervnc-standalone-server \
    tigervnc-common \
    mesa-utils \
    libgl1-mesa-dri \
    alsa-utils \
    fonts-dejavu-core \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/kasm-user -s /bin/bash kasm-user && \
    mkdir -p /home/kasm-user/.vnc && \
    echo "Nospe86842020!!!" | vncpasswd -f > /home/kasm-user/.vnc/passwd && \
    chmod 600 /home/kasm-user/.vnc/passwd && \
    chown -R kasm-user:kasm-user /home/kasm-user

RUN KASMVNC_VERSION=$(curl -s https://api.github.com/repos/kasmtech/KasmVNC/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') && \
    curl -LO "https://github.com/kasmtech/KasmVNC/releases/download/${KASMVNC_VERSION}/kasmvncserver_${KASMVNC_VERSION}_amd64.deb" && \
    apt-get install -y ./kasmvncserver_*.deb && \
    rm -f kasmvncserver_*.deb

COPY --chown=kasm-user:kasm-user start-kde.sh /home/kasm-user/
COPY --chown=kasm-user:kasm-user kasm-icon.png /home/kasm-user/

USER kasm-user
WORKDIR /home/kasm-user
EXPOSE 5901 3389 8080
CMD ["/home/kasm-user/start-kde.sh"]