FROM ubuntu:latest

WORKDIR /

# Add 32-Bit architecture and update.
RUN dpkg --add-architecture i386
RUN apt update && apt upgrade -y && apt dist-upgrade -y

# Install wine
RUN apt install wine64 -y
RUN apt install wine32:i386 -y
RUN apt install xvfb -y

# Install Redist with virtual display
COPY ["./setup/redist/", "/setup/redist/"]
RUN xvfb-run wine /setup/redist/vcredist_2010_x64.exe /install /quiet /norestart && \
    xvfb-run wine /setup/redist/vcredist_2013_x64.exe /install /quiet /norestart && \
    xvfb-run wine /setup/redist/vc_redist.x86.exe /install /quiet /norestart && \
    xvfb-run wine /setup/redist/vc_redist.x64.exe /install /quiet /norestart

# Install SDR-Console
COPY ["./setup/SDR-Radio V3.3, 64-bit, 2024-02-05_0741.exe", "/setup/Setup.exe"]
RUN ["wine", "/setup/Setup.exe", "/S", "/NCRC", "/ALLUSERS=1", "/D=C:\\SDR-Console"]

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT wine ~/.wine/drive_c/SDR-Console/'SDR Console.exe'
