#! /bin/bash

DOCKERFILE="Dockerfile"
BUILD_DIR="."
CONTAINER_NAME="app"
IMAGE_NAME="wangdamingll/app"
IMAGE_TAG="test"

case $1 in
  build)
	echo "rmi image $IMAGE_NAME:$IMAGE_TAG"
	docker rmi $IMAGE_NAME:$IMAGE_TAG
	echo "build image $IMAGE_NAME:$IMAGE_TAG"
	docker build -f $DOCKERFILE  -t="$IMAGE_NAME:$IMAGE_TAG" $BUILD_DIR
	;;
  pull)
	echo "pull image $IMAGE_NAME:$IMAGE_TAG"
	docker pull $IMAGE_NAME:$IMAGE_TAG
	;;
  push)
	echo "push image $IMAGE_NAME:$IMAGE_TAG"
	docker push $IMAGE_NAME:$IMAGE_TAG
	;;
  run)
	echo "run container $CONTAINER_NAME"
	docker run -ti --name $CONTAINER_NAME  $IMAGE_NAME:$IMAGE_TAG
	;;
  start)
	echo "start container $CONTAINER_NAME"
	docker start $CONTAINER_NAME
	docker attach $CONTAINER_NAME
	;;
  stop)
	echo "stop container $CONTAINER_NAME"
	docker stop $CONTAINER_NAME
	;;
  rm)
	echo "rm container $CONTAINER_NAME"
	docker rm -v $CONTAINER_NAME
	;;
  rmi)
	echo "rmi image $IMAGE_NAME:$IMAGE_TAG"
	docker rmi $IMAGE_NAME:$IMAGE_TAG
	;;
  -h|-help|--h|--help)
	echo "app.sh help:./app.sh build|pull|push|run|start|stop"
	echo "build:build image"
	echo "pull:pull image"
	echo "push:push image"
	echo "run:run container"
	echo "start:start container"
	echo "stop:stop container"
	echo "rm:rm container"
	echo "rmi:rm image"
	echo "-h|-help|--h|--help:help info"
	;;
  *)
	echo "command error"
	echo "app.sh -help"
	;;
esac
