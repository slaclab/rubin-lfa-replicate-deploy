DOCKER ?= sudo docker
REPONAME ?= slaclab
IMAGENAME ?= rubin-lfa-replicate
TAG ?= latest

build:
	$(DOCKER) build . -t $(REPONAME)/$(IMAGENAME):$(TAG)

push:
	$(DOCKER) push $(REPONAME)/$(IMAGENAME):$(TAG)
