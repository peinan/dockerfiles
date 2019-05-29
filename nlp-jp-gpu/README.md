# nlp-jp-gpu

## Preparing

Get `docker-compose`

```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

Assert the default-runtime is `nvidia` or you cannot use GPU

```bash
$ cat /etc/docker/daemon.json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```

## Use it

Run image

```bash
$ docker-compose up
```

Check the GPU device

```python
from tensorflow.python.client import device_lib; device_lib.list_local_devices()
```
