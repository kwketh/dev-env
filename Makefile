HOSTNAME=dev-env
IMAGE_NAME=kwketh/dev-env
TAG=latest

IMAGE=$(IMAGE_NAME):$(TAG)
DOCKER=docker $(DOCKER_OPTS)
DOCKERFILE=Dockerfile

build:
	$(DOCKER) build -t $(IMAGE) .

eval:
	$(DOCKER) run $(IMAGE) ${command}

bash:
	$(DOCKER) run -h $(HOSTNAME) --rm -it $(OPTS) $(IMAGE) /bin/zsh

.PHONY: build eval bash

