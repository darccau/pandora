FROM kalilinux/kali-rolling
MAINTAINER darccau <darccau@protonmail.com>

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
chisel \
enum4linux \
sqlmap \
metasploit-framework \
python3 \
man-db \
pacu \
proxychains4 \
dnsutils \
exploitdb \
bloodhound \
crackmapexec \
openssh-server &&\
apt-get autoremove &&\
apt-get clean &&\
rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
