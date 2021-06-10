FROM debian:10
MAINTAINER darccau@protonmail.com

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y upgrade

# Install packages from Ubuntu repos  
RUN apt-get install -y \
    sudo \
    apt-utils \
    locales \
    build-essential \
    gcc-multilib \
    g++-multilib \
    gdb \
    gdb-multiarch \
    python3-dev \
    python3-pip \
    ipython3 \
    man-db \
    manpages-posix \
    default-jdk \
    net-tools \
    nasm \
    cmake \
    vim \
    tmux \
    git \
    binwalk \
    strace \
    ltrace \
    autoconf \
    socat \
    netcat \
    nmap \
    wget \
    tcpdump \
    exiftool \
    unzip \
    man-db \
    manpages-dev \
    libtool-bin \
    libseccomp-dev \
    libini-config-dev \
    libssl-dev \
    libffi-dev \
    libc6-dbg \
    libglib2.0-dev \
    libc6:i386 \
    libc6-dbg:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    libc6-dev-i386

RUN apt-get -y autoremove
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# update locale to include en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN update-locale

# Install stuff from pip repos        
RUN pip3 install scapy
RUN pip3 install pipenv
RUN pip3 install manticore[native]
RUN pip3 install ropper
RUN pip3 install meson
RUN pip3 install ninja

# install pwntools 3
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

# install rizin
RUN git clone https://github.com/rizinorg/rizin /opt/rizin && \
    cd /opt/rizin && \
    meson build && \
    ninja -C build && \
    ninja -C build install

# install libc-database
RUN git clone https://github.com/niklasb/libc-database /opt/libc-database

# install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg && \
    cd /opt/pwndbg && \
    ./setup.sh


ENTRYPOINT ["/bin/bash"]
