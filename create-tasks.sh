#!/bin/sh

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6 \
    --image "aspnet:6.0" \
    --file 6.0/aspnet.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --commit-trigger-enabled false \
    --base-image-trigger-name mcr.microsoft.com/dotnet/aspnet:6.0-bookworm-slim

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6-de \
    --image "aspnet:6.0-de" \
    --file aspnet-de.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --commit-trigger-enabled false \
    --arg BASE="$REGISTRY.azurecr.io/aspnet:6.0" \
    --base-image-trigger-name "$REGISTRY.azurecr.io/aspnet:6.0"

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6-diag \
    --image "aspnet:6.0-diag" \
    --file aspnet-diag.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --arg BASE="$REGISTRY.azurecr.io/aspnet:6.0" \
    --commit-trigger-enabled false \
    --base-image-trigger-name "$REGISTRY.azurecr.io/aspnet:6.0"

az acr task create \
    --registry "$REGISTRY" \
    --name build-aspnet-6-de-diag \
    --image "aspnet:6.0-de-diag" \
    --file aspnet-diag.Dockerfile \
    --context https://github.com/MindKeySoftware/nextgen-docker.git \
    --arg BASE="$REGISTRY.azurecr.io/aspnet:6.0-de" \
    --commit-trigger-enabled false \
    --base-image-trigger-name "$REGISTRY.azurecr.io/aspnet:6.0-de"
