FROM kasmweb/core-ubuntu-22.04:develop

USER root
ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV KASM_VNC_PORT=5901
ENV VNC_PW="Nospe86842020!!!"

# Install KDE Plasma
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    kde-plasma-desktop \
    konsole dolphin \
    && rm -rf /var/lib/apt/lists/*

# Set KDE as the default desktop environment for Kasm
RUN echo "startplasma-x11" > $HOME/.xsession && \
    chmod +x $HOME/.xsession && \
    chown 1000:1000 $HOME/.xsession

USER 1000
