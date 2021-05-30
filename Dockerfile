FROM debian:10
MAINTAINER duardopx@protonmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade

# Packages
RUN apt-get install -y \
    apt-utils \
    autoconf \
    binwalk \
    build-essential \
    cmake \
    curl \ 
    default-jdk \
    exiftool \
    gcc-multilib \
    gdb \
    gdb-multiarch \
    git \
    g++-multilib \
    gperf \
    ipython \
    libc6-dbg \
    libc6-dbg:i386 \
    libc6-dev-i386 \
    libc6:i386 \
    libffi-dev \
    libglib2.0-dev \
    libini-config-dev \
    libncurses5:i386 \
    libseccomp-dev \
    libssl-dev \
    libstdc++6:i386 \
    libtool-bin \
    locales \
    ltrace \
    man-db \
    manpages-dev \
    nasm \
    netcat \
    net-tools \
    nmap \
    python3-dev \
    python3-pip \
    socat \
    strace \
    sudo \
    tcpdump \
    tmux \
    unzip \
    vim \
    wget

RUN apt-get -y autoremove
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set and update locale
RUN locale-gen en_US.UTF-8
RUN update-locale

# pip packages
RUN pip3 install r2pipe
RUN pip3 install scapy

# Pwntools
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev

# Radrare2
RUN git clone https://github.com/radare/radare2.git /opt/radare2 && \
    cd /opt/radare2 && \
    git fetch --tags && \
    git checkout $(git describe --tags $(git rev-list --tags --max-count=1)) && \
    ./sys/install.sh  && \
    make symstall

# Pwndbg
RUN git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg && \
    cd /opt/pwndbg && \
    ./setup.sh

ENTRYPOINT ["/bin/bash"]
