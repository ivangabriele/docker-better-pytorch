ARG BASE_IMAGE=non-existing
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

# We don't want to sit within `/workspace` when accessing the container shell
# because it may be mounted using a network volume (persistent storage).
# The "pre-mount vs mounted" issue being that we need to first `cd /workspace` every time we SSH
# in order for the shell to run a fresh path lookup. Otherwise `/workspace` won't reeflect the mounted volume.
WORKDIR /root

RUN apt update

# Add locales package and set en_US.UTF-8 locale to prrevent bash setlocale warnings
RUN apt install -y --no-install-recommends locales \
 # Enable en_US.UTF-8 in /etc/locale.gen
 && sed -i 's/^# *\(en_US.UTF-8 UTF-8\)$/\1/' /etc/locale.gen \
 # Generate locales
 && locale-gen \
 # Set default system locale
 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
# Keep environment consistent in all processes
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Add github.com to known hosts to prevent SSH authenticity prompt
RUN mkdir -p /etc/ssh \
 && ssh-keyscan -T 5 -t ed25519,ecdsa,rsa github.com >> /etc/ssh/ssh_known_hosts

RUN apt install -y \
  htop \
  kitty \
  nvtop

# Install mise
RUN curl https://mise.run | sh
RUN echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
