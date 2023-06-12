FROM dart:latest AS buildimage

RUN mkdir -p /app/bin

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/atsign-foundation/sshnoports repo
RUN cd repo ; dart pub get
RUN dart compile exe /app/repo/bin/sshnp.dart -o /app/bin/sshnp
RUN dart compile exe /app/repo/bin/sshrv.dart -o /app/bin/sshrv
RUN dart compile exe /app/repo/bin/sshnpd.dart -o /app/bin/sshnpd
RUN dart compile exe /app/repo/bin/sshrvd.dart -o /app/bin/sshrvd
RUN dart compile exe /app/repo/bin/activate_cli.dart -o /app/bin/at_activate

FROM ubuntu:latest

ENV USER=atsign
ENV HOMEDIR=/$USER
ENV USER_ID=1024
ENV GROUP_ID=1024

RUN mkdir -p ${HOMEDIR}

WORKDIR /${HOMEDIR}

# install necessities
RUN apt-get update ; \
    apt-get install -y sudo openssh-server wget curl nano iproute2 tmux vim;

# set up user
RUN groupadd --gid ${GROUP_ID} ${USER} ; \
    useradd --system --shell /bin/bash --home ${HOMEDIR} --uid ${USER_ID} --gid ${GROUP_ID} ${USER} ; \
    usermod -aG sudo ${USER} ; \
    chown -R ${USER}:${USER} ${HOMEDIR} ;

# set up other files/folders
RUN mkdir -p /run/sshd ${HOMEDIR}/.atsign/keys ${HOMEDIR}/.sshnp ${HOMEDIR}/.ssh ; \
    touch ${HOMEDIR}/.ssh/authorized_keys ; \
    chown -R ${USER}:${USER} ${HOMEDIR} ;

# disable sudo password, requires vim
RUN ex +"%s/^%sudo.*$/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g" -scwq! /etc/sudoers ;

# copy binaries from buildimage
RUN mkdir -p ${HOMEDIR}/.local/bin ;
COPY --from=buildimage --chown=${USER}:${USER} /app/bin/* ${HOMEDIR}/.local/bin

# RUN echo '${USER}:123' | sudo chpasswd 
USER ${USER}

ENTRYPOINT sudo service ssh start && bash

