# Dockerfiles

| Image | DockerHub URL |
| ----- | ------------- |
| minimum-jp | https://hub.docker.com/r/peinan/minimum-jp |
| crawler-jp | https://hub.docker.com/r/peinan/crawler-jp |
| nlp-jp | https://hub.docker.com/r/peinan/nlp-jp |
| nlp-jp-gpu | https://hub.docker.com/r/peinan/nlp-jp-gpu |

## How to make a new image

```bash
# create a new branch from the initial commit
$ git chechout -b <branch_name> 22e88

# then add your Dockerfile and anything else
$ mkdir <branch_name>
$ touch <branch_name>/Dockerfile
```
