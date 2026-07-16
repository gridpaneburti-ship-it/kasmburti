FROM redhat/ubi9

LABEL maintainer="gridpaneburti"
LABEL org.opencontainers.image.title="Kasm Workspace - RHEL 9 (UBI)"
LABEL org.opencontainers.image.description="RHEL 9 Universal Base Image desktop environment for Kasm Workspaces with XFCE"

# Set environment variables
ENV KASM_VNC_PORT=5901 \
    KASM_RDP_PORT=3389 \
    DISPLAY=:1 \
    VNC_PASSWORD="Nospe86842020!!!" \
    HOME=/home/kasm-user \
    VNC_GEOMETRY="1920x1080" \
    VNC_DEPTH="24"

# Update, upgrade and install packages
RUN dnf update -y && \
    dnf upgrade -y && \
    dnf install -y \
    epel-release \
    @xfce \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    dialog \
    dbus-x11 \
    tigervnc-server \
    tigervnc-common \
    && dnf clean all && \
    rm -rf /var/cache/dnf

# Create user and VNC config
RUN useradd -m -d /home/kasm-user -s /bin/bash kasm-user && \
    mkdir -p /home/kasm-user/.vnc && \
    echo "$VNC_PASSWORD" | vncpasswd -f > /home/kasm-user/.vnc/passwd && \
    chmod 600 /home/kasm-user/.vnc/passwd && \
    chown -R kasm-user:kasm-user /home/kasm-user

# Install KasmVNC server
RUN KASMVNC_VERSION=$(curl -s https://api.github.com/repos/kasmtech/KasmVNC/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') && \
    curl -LO "https://github.com/kasmtech/KasmVNC/releases/download/${KASMVNC_VERSION}/kasmvncserver_${KASMVNC_VERSION}_amd64.rpm" && \
    dnf install -y ./kasmvncserver_*.rpm && \
    rm -f kasmvncserver_*.rpm && \
    chown -R kasm-user:kasm-user /home/kasm-user

# Set Kasm start script and icon
COPY --chown=kasm-user:kasm-user start.desktop.sh /home/kasm-user/
COPY --chown=kasm-user:kasm-user kasm-icon.png /home/kasm-user/

# Switch to user and expose ports
USER kasm-user
WORKDIR /home/kasm-user
EXPOSE 5901 3389 8080
CMD ["/home/kasm-user/start.desktop.sh"]