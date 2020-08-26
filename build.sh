#!/bin/bash

JENKINS_VERSION=4.3
PREFIX="vorsku"
REPO="jenkins-ssh-agent-armhf"

docker build \
	--rm --tag $PREFIX/$REPO:$JENKINS_VERSION \
	--no-cache --file Dockerfile .
	
docker tag $PREFIX/$REPO:$JENKINS_VERSION $PREFIX/$REPO:latest
docker push $PREFIX/$REPO:$JENKINS_VERSION
docker push $PREFIX/$REPO:latest
