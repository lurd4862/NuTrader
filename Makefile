PWD=`pwd`
project := $(shell basename $$PWD | tr '[:upper:]' '[:lower:]')
image_name="${project}-image"
container_name="${project}-container"
DOCKERFILE=Dockerfile

build-image:
	docker build \
		--tag ${image_name} \
		-f ${DOCKERFILE} \
		.

run-container:
	docker stop ${container_name} &&\
	docker rm ${container_name} &&\
	docker run -ti -p 8888:8888 -v ${PWD}:/home/jovyan/ ${image_name}

run: build-image run-container
