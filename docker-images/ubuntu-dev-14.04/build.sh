#!/bin/bash

echo "detected host UID=$UID"

if [ "$#" -ne 1 ] 
then 
	docker build --no-cache --build-arg CUSTOM_UID=$UID -t ubuntu-dev:14.04 .
else
	docker build --no-cache --build-arg CUSTOM_UID=$UID -t $1 .
fi
