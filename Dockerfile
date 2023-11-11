FROM kalilinux/kali-rolling

LABEL maintainer="darccau@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG PACKAGES="vim tmux tmuxp tcpdump curl sed gawk unzip wget ncat rsyslog socat git nmap ffuf python3 man-db proxychains4 dnsutils iproute2 exploitdb"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends $PACKAGES \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER darccau

WORKDIR /documentation

ENTRYPOINT ["/bin/bash"]
