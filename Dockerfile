FROM kalilinux/kali-rolling:2024.4

LABEL org.opencontainers.image.authors="darccau@gmail.com"
LABEL org.opencontainers.image.title="Portable pentest container"
LABEL org.opencontainers.image.description="A lightweight Kali Linux container pre-configured with tmux and curl."

ARG DEBIAN_FRONTEND=noninteractive
ARG PACKAGES="vim curl ncat git iproute2 tmux"

WORKDIR /artifacts

RUN apt-get update && \
  apt-get install --no-install-recommends --yes $PACKAGES && \
  curl -o page.html https://example.com && \
  rm -rf /var/lib/apt/lists/*

USER pandora

ENTRYPOINT ["tmux"]
CMD ["new-session", "-s", "target"]
