#!/bin/bash

echo "detected host UID=$UID"

docker build --no-cache --build-arg CUSTOM_UID=$UID -t ubuntu-dev:16.04 .
