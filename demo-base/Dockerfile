FROM dart:latest AS buildimage

RUN mkdir -p /app/bin

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/atsign-foundation/sshnoports repo

RUN cd repo ; git fetch origin  ; git checkout origin/trunk ; dart pub get ; \
# RUN cd repo ; git fetch origin ; git checkout origin/gkc-refactor-sshnp ; dart pub get ; \
    dart compile exe /app/repo/bin/sshnp.dart -o /app/bin/sshnp ; \
    dart compile exe /app/repo/bin/sshrv.dart -o /app/bin/sshrv ; \
    dart compile exe /app/repo/bin/sshnpd.dart -o /app/bin/sshnpd ; \
    dart compile exe /app/repo/bin/sshrvd.dart -o /app/bin/sshrvd ; \
    dart compile exe /app/repo/bin/activate_cli.dart -o /app/bin/at_activate ; 

FROM ubuntu:latest
# FROM dart:latest

ENV USER=atsign
ENV HOMEDIR=/$USER
ENV USER_ID=1024
ENV GROUP_ID=1024

# install necessities
RUN apt-get update ; \
    apt-get install -y sudo wget curl openssh-server nano vim iproute2 nmap tmux git;

# set up user
RUN groupadd --gid ${GROUP_ID} ${USER} ; \
    useradd --system --shell /bin/bash --home ${HOMEDIR} --uid ${USER_ID} --gid ${GROUP_ID} ${USER} ; \
    usermod -aG sudo ${USER} ;

# set up other files/folders, sshnp/sshnpd needs access to ~/.ssh, ~/.sshnp and especially the ~/.ssh/authorized_keys file
RUN mkdir -p ${HOMEDIR}/.sshnp ${HOMEDIR}/.ssh ; \
    touch ${HOMEDIR}/.ssh/authorized_keys ; \
    chown -R ${USER}:${USER} ${HOMEDIR} ;

# disable sudo password, requires vim
RUN ex +"%s/^%sudo.*$/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g" -scwq! /etc/sudoers ;

# "PasswordAuthentication no" in /etc/ssh/sshd_config
RUN sed -E -i 's|^#?(PasswordAuthentication)\s.*|\1 no|' /etc/ssh/sshd_config

# "ListenAddress 127.0.0.1" in /etc/ssh/sshd_config
RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 127.0.0.1/g' /etc/ssh/sshd_config

# copy binaries from buildimage
RUN mkdir -p ${HOMEDIR}/.local/bin  ${HOMEDIR}/repo ;
COPY --from=buildimage --chown=${USER}:${USER} /app/bin/* ${HOMEDIR}/.local/bin

WORKDIR ${HOMEDIR}

# RUN echo '${USER}:123' | sudo chpasswd 
    
USER ${USER}

ENTRYPOINT sudo service ssh start && bash

