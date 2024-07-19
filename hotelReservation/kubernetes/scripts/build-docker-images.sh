#!/bin/bash

cd $(dirname $0)/..


EXEC="docker"

USER="krushna"

TAG="latest"

# ENTER THE ROOT FOLDER
cd ../
ROOT_FOLDER=$(pwd)
$EXEC create --name mybuilder --use

for i in hotel-reservation #uncomment to build multiple images
do
  IMAGE=${i}
  echo Processing image ${IMAGE}
  cd $ROOT_FOLDER
  $EXEC build -t "$USER"/"$IMAGE":"$TAG" -f Dockerfile .
  cd $ROOT_FOLDER

  echo
done


cd - >/dev/null
