FROM ubuntu

ENV USER=atsign
ENV HOMEDIR=/$USER

# make the keys dir to hold `.atKeys`
RUN mkdir -p $HOMEDIR/.atsign/keys

# initialize `~/.ssh/authorized_keys`
RUN mkdir -p $HOMEDIR/.ssh
RUN touch $HOMEDIR/.ssh/authorized_keys

# make this folder whatever this does
RUN mkdir /run/sshd

# copy the `keys/` dir to container
COPY keys /$USER/.atsign/keys

# all of our stuff will go in `/app`
ENV WORKDIR_NAME=app
WORKDIR /$WORKDIR_NAME

# install a bunch of stuff
RUN apt-get update && apt-get install -y openssh-client openssh-server wget sudo iputils-ping iproute2 ncat telnet net-tools nmap iperf3 tmux traceroute nano vim watch;

# setup permissions
ENV USER_ID=1024
ENV GROUP_ID=1024
RUN addgroup --gid $GROUP_ID $USER
RUN sysctl -w net.ipv4.ping_group_range="0 1024"
RUN useradd --system --uid $USER_ID --gid $GROUP_ID --shell /bin/bash  --home $HOMEDIR $USER
RUN chown -R $USER:$USER $HOMEDIR
RUN chmod 600 $HOMEDIR/.ssh/authorized_keys
RUN usermod -aG sudo $USER
RUN touch /${WORKDIR_NAME}/.startup.sh
RUN chmod 755 /${WORKDIR_NAME}/.startup.sh

# wget ssh no ports and untar it
RUN wget https://github.com/atsign-foundation/sshnoports/releases/download/v3.1.2/sshnp-linux-arm64.tgz
RUN tar -xvf sshnp-linux-arm64.tgz

# copy the sshnpd binary to `/usr/local/at/`
RUN cd sshnp ; \
    mkdir -p /usr/local/at/ ; \
    cp sshnp /usr/local/at/ ; \
    cp sshrv /usr/local/at/ ;

# 
COPY .startup.sh /$WORKDIR_NAME