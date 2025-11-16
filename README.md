# Better PyTorch Docker Image

[![img-docker]][link-docker]
[![img-github-actions]][link-github-actions]

- Base: [runpod/pytorch](https://hub.docker.com/r/runpod/pytorch)
- Additional development tools: Git LFS, mise.
- Additional Python tools: uv.
- Additional system tools: htop, nvtop.
- Additional terminal tools: kitty-terminfo.
- Fixes:
  - Remove bash locale warnings on initial shell start.
  - Pre-add github.com to known hosts to prevent SSH authenticity prompt.
  - Change default working directory to `/root`,
    preventing not-yet-updated path issues when using network volumes mounted on `/workspace`.

## Environment Variables

All environment variables are optional.

- `PUBLIC_KEY`: Set your SSH public key into authorized_keys in ~/.ssh. If set, SSH daemon will be started on port 22.
- `JUPYTER_PASSWORD`: JupyterLab password that is used to auth. If set, JupyterLab will be started on port 8888.

## Contribute

### Build

```sh
./bake.sh
```

---

[img-docker]: https://img.shields.io/docker/pulls/ivangabriele/better-pytorch?style=for-the-badge
[img-github-actions]: https://img.shields.io/github/actions/workflow/status/ivangabriele/docker-better-pytorch/release.yml?branch=main&label=Release&style=for-the-badge
[link-docker]: https://hub.docker.com/r/ivangabriele/better-pytorch
[link-github-actions]: https://github.com/ivangabriele/docker-better-pytorch/actions/workflows/release.yml
