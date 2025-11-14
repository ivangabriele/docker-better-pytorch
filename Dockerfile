ARG BASE_IMAGE=non-existing
FROM ${BASE_IMAGE}

WORKDIR /

RUN apt update
RUN apt install -y \
  htop \
  kitty

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

CMD ["/start.sh"]
