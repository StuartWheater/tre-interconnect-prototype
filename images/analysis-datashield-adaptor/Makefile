#
# Copyright (c) 2023, TRE-FX Consortium Members
# Copyright (c) 2023-2024, Arjuna Technologies Limited, Newcastle upon Tyne, Tyne and Wear, UK.
#

include ../settings.mk

QUARKUS = quarkus
MVN     = mvn
PODMAN  = podman

IMAGE_NAME = docker.io/risbic/analysis-datashield-adaptor
IMAGE_TAG  = latest

all:
	$(QUARKUS) build
	$(PODMAN) build -t $(IMAGE_NAME):$(IMAGE_TAG) -f src/main/docker/Dockerfile.jvm .

push: all
	$(PODMAN) image push $(IMAGE_NAME):$(IMAGE_TAG)

clean:
	$(MVN) clean

purge: clean
	$(PODMAN) image rm -i $(IMAGE_NAME):$(IMAGE_TAG)
