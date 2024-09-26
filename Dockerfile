FROM alpine

LABEL maintainer="Piyush Sohal (piyush.sohal94@gmail.com)"

# # https://github.com/sgerrand/alpine-pkg-glibc/releases
# ENV GLIBC_VER=2.33-r0

# https://github.com/PowerShell/PowerShell/releases
ENV PWSH_VER=7.4.5

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache wget curl bind-tools inetutils-telnet postgresql-client mysql-client xz tar unzip openssl bash less python3 py3-pip perl

RUN wget -4 -q https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VER}/powershell-${PWSH_VER}-linux-x64.tar.gz && \
    mkdir -p /opt/pwsh && tar xzvf powershell-${PWSH_VER}-linux-x64.tar.gz -C /opt/pwsh && rm -vrf powershell-${PWSH_VER}-linux-x64.tar.gz && \
    chmod +x /opt/pwsh/pwsh && ln -sf /opt/pwsh/pwsh /usr/local/bin/pwsh
