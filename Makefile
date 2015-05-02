HOSTNAME=dev-env
IMAGE_NAME=kwketh/dev-env
TAG=latest

IMAGE=$(IMAGE_NAME):$(TAG)
DOCKER=docker $(DOCKER_OPTS)
DOCKERFILE=Dockerfile

build:
	$(DOCKER) build -tq $(IMAGE) .

.PHONY: build

