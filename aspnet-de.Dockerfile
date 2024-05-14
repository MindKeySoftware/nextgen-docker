ARG BASE

FROM alpine AS fontsbuild

RUN apk add wine

FROM ${BASE}

COPY --from=fontsbuild /usr/share/wine/fonts/ /usr/share/fonts/truetype/wine/

# For dev express 
# https://docs.devexpress.com/OfficeFileAPI/401441/dotnet-core-support/use-office-file-api-on-linux
# https://www.mono-project.com/download/stable/#download-lin-debian
RUN echo "deb http://deb.debian.org/debian bookworm main contrib" > /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends gnupg \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list \
    && apt install -y --no-install-recommends libc6 libicu-dev libfontconfig1 libgdiplus libharfbuzz0b libfreetype6 ttf-mscorefonts-installer \
    && apt remove -y gnupg \
    && apt clean autoclean \
    && apt autoremove --yes \
    && rm -rf /var/lib/apt/lists