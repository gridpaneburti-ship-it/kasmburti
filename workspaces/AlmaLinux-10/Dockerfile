FROM kasmweb/core-almalinux-9:develop

USER root
ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV KASM_VNC_PORT=5901
ENV VNC_PW="Nospe86842020!!!"

RUN dnf config-manager --set-enabled crb && \
    dnf install -y epel-release && \
    dnf groupinstall -y "KDE Plasma Workspaces" && \
    dnf clean all

RUN echo "startplasma-x11" > $HOME/.xsession && \
    chmod +x $HOME/.xsession && \
    chown 1000:1000 $HOME/.xsession

USER 1000
