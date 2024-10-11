ARG BASE

FROM alpine AS fontsbuild

RUN apk add wine

FROM ${BASE}

COPY --from=fontsbuild /usr/share/wine/fonts/ /usr/share/fonts/truetype/wine/

# For dev express 
RUN echo "deb http://deb.debian.org/debian bookworm main contrib" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends libfontconfig1 ttf-mscorefonts-installer \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/apt/lists
