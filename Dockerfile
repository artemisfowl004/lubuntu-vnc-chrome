FROM abrahamb/lubuntu-vnc

MAINTAINER msca

RUN apt-get install -y libappindicator3-1

RUN cd /tmp \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb 

#TODO: change display name
#TODO: outlook, openvpn