ARG BASE

FROM alpine as build

RUN mkdir /dotnettools/ \
    && wget -q -O /dotnettools/dotnet-counters https://aka.ms/dotnet-counters/linux-x64 \
    && wget -q -O /dotnettools/dotnet-dump https://aka.ms/dotnet-dump/linux-x64 \
    && wget -q -O /dotnettools/dotnet-gcdump https://aka.ms/dotnet-gcdump/linux-x64 \
    && wget -q -O /dotnettools/dotnet-trace https://aka.ms/dotnet-trace/linux-x64 \
    && wget -q -O /dotnettools/dotnet-stack https://aka.ms/dotnet-stack/linux-x64 \
    && wget -q -O /dotnettools/dotnet-sos https://aka.ms/dotnet-sos/linux-x64 \
    && chmod +x /dotnettools/dotnet-counters \
    && chmod +x /dotnettools/dotnet-dump \
    && chmod +x /dotnettools/dotnet-gcdump \
    && chmod +x /dotnettools/dotnet-trace \
    && chmod +x /dotnettools/dotnet-stack \
    && chmod +x /dotnettools/dotnet-sos

FROM ${BASE}
RUN apt update \
    && apt install -y --no-install-recommends openssh-server \ 
    && echo "root:Docker!" | chpasswd \
    && apt clean autoclean \
    && apt autoremove --yes \
    && rm -rf /var/lib/apt/lists

COPY ./ssh/sshd_config /etc/ssh/
COPY ./ssh/ssh_setup.sh /tmp/

RUN chmod +x /tmp/ssh_setup.sh \
    && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
    && rm /tmp/ssh_setup.sh \
    && echo "echo Starting SSH" >> /start.sh \
    && echo "service ssh start" >> /start.sh 

COPY --from=build /dotnettools/ /dotnettools/

EXPOSE 2222