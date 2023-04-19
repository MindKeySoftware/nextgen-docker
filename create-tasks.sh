#!/bin/sh

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6 \
    --image "aspnet:6.0" \
    --file aspnet.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --commit-trigger-enabled false

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6-diag \
    --image "aspnet:6.0-diag" \
    --file aspnet-diag.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --arg REGISTRY="$REGISTRY.azurecr.io" \
    --commit-trigger-enabled false
