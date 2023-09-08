FROM kalilinux/kali-rolling
MAINTAINER darccau <darccau@gmail.com>

workdir documentation

ARG DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --yes --no-install-recommends  vim \
tmux \
tmuxp \
tcpdump \
curl \
unzip \
wget \
ncat \
socat \
git \
nmap \
ffuf \
python3 \
man-db \
proxychains4 \
dnsutils \
exploitdb &&\
apt-get autoremove &&\
apt-get clean &&\
rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
