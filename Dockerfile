FROM ubuntu

MAINTAINER msca from  abrahamb/lubuntu-vnc by Abraham Bribiesca

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list \ 
    && echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list \
    && apt-get update && apt-get dist-upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y keyboard-configuration \
    && unset DEBIAN_FRONTEND

RUN apt-get install -y lubuntu-default-settings
RUN apt-get install -y \
        x11vnc\
        vnc-java\
        xvfb\
        abiword anacron\
        busybox-initramfs\
        cups-core-drivers\
        galculator\
        gsfonts\
        leafpad\
        lxpanel-indicator-applet-plugin\
        lxterminal\
        qpdf\
        qt-at-spi\
        unzip\
        update-inetd\
        okular\
        kolourpaint4\
        xterm\
        lxtask\
        netstress\
        gnumeric\
        gnumeric-plugins-extra\
        gnome-characters\
        xpad\
        lxsession\
        lxsession-edit\
        git\
        libnet-ifconfig-wrapper-perl\
        wget\
        system-tools-backends

RUN mkdir /root/noVNC \
    && git clone https://github.com/novnc/noVNC.git /root/noVNC/

#Install Chrome
RUN cd /tmp \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb 

RUN apt-get clean all

COPY startup.sh /root/startup.sh/
RUN chmod 0755 /root/startup.sh 
CMD /root/startup.sh
