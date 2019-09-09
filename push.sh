#!/bin/bash
NAME=upsnet

docker build -t curtkim/$NAME .
docker push curtkim/$NAME
