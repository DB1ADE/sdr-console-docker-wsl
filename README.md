# SDR-Console Docker WSL
Run SDR-Console as docker container with WSL.

## Introduction
This is the result of some hours trial-and-error, to get my amateur radio software shack ready to move from Windows to Linux.

There is a lot of usefull amateur radio software. Some are quiet ancient and lots are built for Windows only.
When moving to Linux, many might not run natively on Linux. So I decided to give a chance to docker containers.
Almost any Windows app can run on a Linux system using `wine`.
Why not using a standard Linux distro container, like ubuntu, setup wine and use this as base for all the amateur radio apps.

## Getting Started
1. Get SDR-Console setup from [here](https://www.sdr-radio.com/console) and extract the vcredist setup (use e.g. 7zip).
2. Prepare file structure like this:
  - Dockerfile
  - Docker-Compose.yaml
  - setup/
    - SDR-Radio V3.3, 64-bit, 2024-02-05_0741.exe
    - redist/
      - vc_redist.x64.exe
      - vc_redist.x86.exe
      - vcredist_2010_x64.exe
      - vcredist_2013_x64.exe
3. Update setup file versions in Dockerfile.
4. run `docker-compose up -d`

## Restrictions
The Docker-Compose file is setting volumes and variables for WSL2g. For Linux host, you have to change them. Don't ask me how.

Currently there is no passthrough of USB devices to the container. Maybe use [USB/IP](https://usbip.sourceforge.net/) for this.

Sound is also not tested.

## See also SDRConnect
[Link](https://www.sdrplay.com/sdrconnect/)

This app might become the multi platform successof of SDR-Console.
