#!/bin/sh


BUILD_INFO=(  "imax1000/ocserv:1.0.2" )




# Check command exist function
_command_exists() {
    type "$1" &> /dev/null
}

if _command_exists docker; then
    DOCKER_BIN=$(which docker)
else
    echo "ERROR: Command 'docker' not found."
    exit 1
fi

#echo START build docker image ver:${VER}
#docker build --build-arg VER=${VER} -t imax1000/occserv:${VER} .

for DATA in ${BUILD_INFO[@]}; do
    IMAGE_NAME=$(echo "${DATA}" | awk -F':' '{print $1}')
    IMAGE_VER=$(echo "${DATA}" | awk -F':' '{print $2}')
    echo "Docker remove old image '${IMAGE_NAME}:${IMAGE_VER}'..."
    ${DOCKER_BIN} rmi ${IMAGE_NAME}:${IMAGE_VER}
    echo "Docker build image '${IMAGE_NAME}:${IMAGE_VER}'..."
    ${DOCKER_BIN} build -t ${IMAGE_NAME}:${IMAGE_VER} --build-arg VERSION=${IMAGE_VER} --build-arg NAME=${IMAGE_NAME} -f Dockerfile .
#    ${DOCKER_BIN} build -t ${IMAGE_NAME}:${IMAGE_VER} --no-cache --progress=plain --build-arg VERSION=${IMAGE_VER}-f Dockerfile .
    if [ $? -eq 0 ]; then
	echo "Done build image."
	#echo "Docker push image '${IMAGE_NAME}:${IMAGE_VER}'..."
	#${DOCKER_BIN} push ${IMAGE_NAME}:${IMAGE_VER}
    else
	echo "ERROR: Failed build image '${IMAGE_NAME}:${IMAGE_VER}'"
	exit 1
    fi
done