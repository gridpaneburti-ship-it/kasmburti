FROM rockylinux:10

LABEL maintainer="gridpaneburti"
LABEL org.opencontainers.image.title="Kasm Workspace - Rocky Linux 10 KDE"
LABEL org.opencontainers.image.description="Rocky Linux 10 con KDE Plasma para Kasm Workspaces"

ENV KASM_VNC_PORT=5901 \
    KASM_RDP_PORT=3389 \
    DISPLAY=:1 \
    HOME=/home/kasm-user

# Updates y instalación KDE
RUN dnf update -y && \
    dnf upgrade -y && \
    dnf groupinstall -y "KDE Plasma Workspaces" && \
    dnf install -y x11vnc xf86-vnc xvfb novnc websockify dialog dbus-x11 tigervnc-server && \
    rm -rf /var/cache/dnf

# Usuario
RUN useradd -m -d /home/kasm-user -s /bin/bash kasm-user && \
    echo "Nospe86842020!!!" | vncpasswd -f > /home/kasm-user/.vnc/passwd && \
    chmod 600 /home/kasm-user/.vnc/passwd && \
    chown -R kasm-user:kasm-user /home/kasm-user

# KasmVNC
RUN KASMVNC_VERSION=$(curl -s https://api.github.com/repos/kasmtech/KasmVNC/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') && \
    curl -LO "https://github.com/kasmtech/KasmVNC/releases/download/${KASMVNC_VERSION}/kasmvncserver_${KASMVNC_VERSION}_amd64.rpm" && \
    dnf install -y ./kasmvncserver_*.rpm && \
    rm -f kasmvncserver_*.rpm

COPY --chown=kasm-user:kasm-user start-kde.sh /home/kasm-user/ && \
    cp kasm-icon.png /home/kasm-user/

USER kasm-user
WORKDIR /home/kasm-user
EXPOSE 5901 3389 8080
CMD ["/home/kasm-user/start-kde.sh"]