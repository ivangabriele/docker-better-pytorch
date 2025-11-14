# Better PyTorch Docker Image

- Base: [runpod/pytorch](https://hub.docker.com/r/runpod/pytorch)
- Additional Python tools: uv.
- Additional terminal tools: kitty-terminfo.

## Environment Variables

All environment variables are optional.

- `PUBLIC_KEY`: Set your SSH public key into authorized_keys in ~/.ssh. If set, SSH daemon will be started on port 22.
- `JUPYTER_PASSWORD`: JupyterLab password that is used to auth. If set, JupyterLab will be started on port 8888.

## Contribute

### Build

```sh
./bake.sh
```
