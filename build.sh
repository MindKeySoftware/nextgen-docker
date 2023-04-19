#! /bin/sh

docker build \
    -t local/aspnet:6.0 \
    -f aspnet.Dockerfile \
    .

docker build \
    -t local/aspnet:6.0-diag \
    --build-arg REGISTRY=local \
    -f aspnet-diag.Dockerfile \
    .