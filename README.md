# Dockerfiles

- minimum-jp: https://cloud.docker.com/u/peinan/repository/docker/peinan/minimum-jp
- crawler-jp: https://cloud.docker.com/u/peinan/repository/docker/peinan/crawler-jp
- nlp-jp: https://cloud.docker.com/u/peinan/repository/docker/peinan/nlp-jp
- nlp-jp-gpu: https://cloud.docker.com/repository/docker/peinan/nlp-jp-gpu

## How to make a new image

```bash
# create a new branch from the initial commit
$ git chechout -b <branch_name> 22e88

# then add your Dockerfile and anything else
$ mkdir <branch_name>
$ touch <branch_name>/Dockerfile
```
