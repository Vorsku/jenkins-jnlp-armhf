#!/bin/bash
IMAGE_VERSION=0.2
PREFIX="vorsku"
REPO="jenkins-ssh-agent-armhf"

docker build \
	--rm --tag $PREFIX/$REPO:$JENKINS_VERSION \
	--rm --tag $PREFIX/$REPO:$IMAGE_VERSION \
	--no-cache --file Dockerfile .

docker tag $PREFIX/$REPO:$JENKINS_VERSION $PREFIX/$REPO:latest
docker push $PREFIX/$REPO:$JENKINS_VERSION
docker tag $PREFIX/$REPO:$IMAGE_VERSION $PREFIX/$REPO:latest
docker push $PREFIX/$REPO:$IMAGE_VERSION
docker push $PREFIX/$REPO:latest
