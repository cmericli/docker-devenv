#!/bin/bash

echo "detected host UID=$UID"

if [ "$#" -ne 1 ] 
then 
	docker build --no-cache --build-arg CUSTOM_UID=$UID -t ubuntu-dev:16.04 .
else
	docker --no-cache --build-arg CUSTOM_UID=$UID build -t $1 .
fi
