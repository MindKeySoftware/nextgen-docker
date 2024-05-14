#! /bin/sh
set -ex

# 6.0
docker build \
    -t local/aspnet:6.0 \
    -f 6.0/aspnet.Dockerfile \
    .

docker build \
    -t local/aspnet:6.0-de \
    --build-arg BASE=local/aspnet:6.0 \
    -f aspnet-de.Dockerfile \
    .

docker build \
    -t local/aspnet:6.0-diag \
    --build-arg BASE=local/aspnet:6.0 \
    -f aspnet-diag.Dockerfile \
    .

docker build \
    -t local/aspnet:6.0-de-diag \
    --build-arg BASE=local/aspnet:6.0-de \
    -f aspnet-diag.Dockerfile \
    .

# 8.0

docker build \
    -t local/aspnet:8.0 \
    -f 8.0/aspnet.Dockerfile \
    .

docker build \
    -t local/aspnet:8.0-de \
    --build-arg BASE=local/aspnet:8.0 \
    -f aspnet-de.Dockerfile \
    .

docker build \
    -t local/aspnet:8.0-diag \
    --build-arg BASE=local/aspnet:8.0 \
    -f aspnet-diag.Dockerfile \
    .

docker build \
    -t local/aspnet:8.0-de-diag \
    --build-arg BASE=local/aspnet:8.0-de \
    -f aspnet-diag.Dockerfile \
    .