# Original runpod/pytorch images versions and tag slugs
# https://hub.docker.com/r/runpod/pytorch/tags

RUNPOD_VERSION = "1.0.2"

CUDA_VERSIONS = [
  {
    version = "13.0.0"
    slug = "cu1300"
    ubuntu_versions = ["24.04"]
  }
]

UBUNTU_VERSIONS = [
  {
    version = "24.04"
    slug = "ubuntu2404"
  }
]

PYTORCH_VERSIONS = [
  {
    version = "2.8.0"
    slug = "torch280"
  }
]

# Custom images versions and tag slugs

# N/A for now

# Latest version picking

LATEST_VERSION = {
  cuda_slug = CUDA_VERSIONS[ length(CUDA_VERSIONS) - 1 ].slug
  pytorch_slug = PYTORCH_VERSIONS[ length(PYTORCH_VERSIONS) - 1 ].slug
  ubuntu_slug = UBUNTU_VERSIONS[ length(UBUNTU_VERSIONS) - 1 ].slug
}
