USER_NAME=peinan
IMAGE_NAME=nlp-jp-gpu
VERSION=latest

build:
	docker build . -t $(USER_NAME)/$(IMAGE_NAME):$(VERSION)

clean:
	docker container prune
	docker image prune


push:
	docker push $(USER_NAME)/$(IMAGE_NAME):$(VERSION)
