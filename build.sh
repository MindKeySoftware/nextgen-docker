#! /bin/sh

docker build \
    -t local/aspnet:6.0 \
    ./asp.net/6.0

docker build \
    -t local/aspnet:6.0-diag \
    --build-arg REGISTRY=local \
    ./asp.net/6.0-diag

