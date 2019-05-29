# Dockerfiles

| Image Nmae | Features |
| ---------- | -------- |
| minimum-jp [🔗](https://hub.docker.com/r/peinan/minimum-jp) | The minimum setup that only includes some basical packages and Python 3.6 |
| crawler-jp [🔗](https://hub.docker.com/r/peinan/crawler-jp) | A setup for the crawling use that inlcudes selenium |
| nlp-jp [🔗](https://hub.docker.com/r/peinan/nlp-jp) | A basical setup for NLP. It includes mecab+neologd and some other Python packages |
| nlp-jp-gpu [🔗](https://hub.docker.com/r/peinan/nlp-jp-gpu) | A GPU-ready setup for NLP. It assumes a heavy use, so the image size is very large (approx 10 GB) |

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
