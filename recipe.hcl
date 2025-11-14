group "default" {
  targets = ["matrix", "latest"]
}

target "common" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]
}

target "matrix" {
  inherits = ["common"]

  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]

  matrix = {
    combo = flatten([
      for cuda in CUDA_VERSIONS: [
        for pytorch in PYTORCH_VERSIONS: [
          for ubuntu in UBUNTU_VERSIONS: {
            cuda_slug = cuda.slug
            pytorch_slug = pytorch.slug
            ubuntu_slug = ubuntu.slug
          } if contains(cuda.ubuntu_versions, ubuntu.version)
        ]
      ]
    ])
  }

  args = {
    BASE_IMAGE = "runpod/pytorch:${RUNPOD_VERSION}-${combo.cuda_slug}-${combo.pytorch_slug}-${combo.ubuntu_slug}"
  }

  tags = [
    "ivangabriele/better-pytorch:${combo.cuda_slug}-${combo.pytorch_slug}-${combo.ubuntu_slug}"
  ]
}

target "latest" {
  inherits = ["common"]

  args = {
    BASE_IMAGE = "runpod/pytorch:${RUNPOD_VERSION}-${LATEST_VERSION.cuda_slug}-${LATEST_VERSION.pytorch_slug}-${LATEST_VERSION.ubuntu_slug}"
  }

  tags = [
    "ivangabriele/better-pytorch:latest"
  ]
}
