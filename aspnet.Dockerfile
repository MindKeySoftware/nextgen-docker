FROM mcr.microsoft.com/dotnet/aspnet:6.0-bookworm-slim

# Enable automatic creation of dumps when a process crashes
ENV COMPlus_DbgEnableMiniDump="1"
# Create a base directory for dumps under /home so that the
# dumps are accessible from the build container too (since a runtime container might have already crashed)
ENV DUMP_DIR="/home/logs/dumps"
RUN echo "#! /bin/sh" >> /start.sh \
    && echo "set -e" >> /start.sh \
    && echo "mkdir -p \"$DUMP_DIR\"" >> /start.sh \
    && echo "chmod 777 \"$DUMP_DIR\"" >> /start.sh \
    && mkdir /app \
    && adduser --disabled-password --home /home/app --gecos '' app && chown -R app /app \
    && chmod +x /start.sh

# disable reload of configration on change
ENV ASPNETCORE_hostBuilder__reloadConfigOnChange=false
