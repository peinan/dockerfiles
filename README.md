# Dockerfiles

|     | Image Nmae | Build Status | Features |
| --- | ---------- | ------------ | -------- |
| [🔗](https://hub.docker.com/r/peinan/minimum-jp) | minimum-jp | ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/peinan/minimum-jp.svg?logo=docker&style=flat-square) | The minimum setup that only includes some basical packages and Python 3.6 |
| [🔗](https://hub.docker.com/r/peinan/crawler-jp) | crawler-jp | ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/peinan/crawler-jp.svg?logo=docker&style=flat-square) | A setup for the crawling use that inlcudes selenium |
| [🔗](https://hub.docker.com/r/peinan/nlp-jp) | nlp-jp | ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/peinan/nlp-jp.svg?logo=docker&style=flat-square) | A basical setup for NLP. It includes mecab+neologd and some other Python packages |
| [🔗](https://hub.docker.com/r/peinan/nlp-jp-gpu) | nlp-jp-gpu | ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/peinan/nlp-jp-gpu.svg?logo=docker&style=flat-square) | A GPU-ready setup for NLP. It assumes a heavy use, so the image size is very large (approx 10 GB) |

### Common settings

- Ubuntu: 16.04
- Python: 3.6
- locale: ja_JP

## How to make a new image

```bash
# create a new branch from the initial commit
$ git chechout -b <branch_name> 22e88

# then add your Dockerfile and anything else
$ mkdir <branch_name>
$ touch <branch_name>/Dockerfile
```
