ARG BASE_IMAGE=non-existing
FROM ${BASE_IMAGE}


# RUN python -m pip uninstall -y torch torchvision torchaudio
# RUN python -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu130

RUN apt update
RUN apt install -y \
  htop \
  kitty

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

WORKDIR /workspace

# CMD ["/start.sh"]
