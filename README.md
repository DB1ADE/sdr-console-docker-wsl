# SDR-Console Docker WSL
Run SDR-Console as docker container with WSL.

## Restrictions
The Docker-Compose file is setting volumes and variables for WSL2g. For Linux host, you have to change them. Don't ask me how.

## Getting Started
1. Get SDR-Console setup from (here)[https://www.sdr-radio.com/console] and extract the vcredist setup (use e.g. 7zip).
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
