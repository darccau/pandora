FROM kalilinux/kali-rolling

LABEL org.opencontainers.image.authors="darccau@gmail.com"
LABEL org.opencontainers.image.title="Portable pentest container"
LABEL org.opencontainers.image.description="A lightweight Kali Linux container pre-configured with essential tools"

ARG DEBIAN_FRONTEND=noninteractive
ARG PACKAGES="curl iproute2 ncat iputils-ping"

WORKDIR /artifacts

COPY setup.sh .

RUN apt-get update && \
  apt-get install --no-install-recommends --yes $PACKAGES

ENTRYPOINT [ "/bin/bash" ]
