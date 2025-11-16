ARG BASE_IMAGE=non-existing
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

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

RUN apt install -y \
  htop \
  kitty \
  nvtop

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

WORKDIR /workspace

# CMD ["/start.sh"]
