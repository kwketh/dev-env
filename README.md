# dev-env

The repository contains files for managing a virtualized development environment.

Entering the development environment (DE) is possible from any directory on the host machine with `dev-env` command, after which the host current directory is mounted in the DE as the workspace folder.

## Pros
 - Does not require installing hundreds of packages on the host machine
 - All packages in the DE stay up-to-date without any effort to update
 - Fault tolerant environment (any changes to system directories or packages in the DE are discarded at the end of the session)
 - Package conflicts and installation issues are very unlikely considering all packages installed in the DE are always up-to-date. On top of that any changes to the system directories are always discarded at the end of each session preventing any potential errors made to the packages

## Cons
 - Not everybody is a fan of terminal and doing ther development within it
 - Requires 950 MB of HDD space for virtual image to be built
 - Rebuilding may vary from seconds up to 10 minutes depending on the change
   in packages (order in specific) as well as internet speed to fetch the packages

## Example
```
user ~ $ cd ~/helloworld
user ~/helloworld $ which binwalk
binwalk not found
user ~/helloworld $ dev-env
env0 /workspace/helloworld $ binwalk file
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             ELF, 64-bit LSB executable, AMD x86-64, version 1 (SYSV)
93088         0x16BA0         Copyright string: "Copyright %s %d kwketh"
env0 /workspace/helloworld $ exit
user ~/helloworld $ 
```

### Optional arguments

With no flags, `dev-env` will mount the host current directory with read-write mode, any modification to the files will affect the host machine.

Read-only flag (`dev-env -r`) mounts the host current directory as read-only within the DE.

Read-only + mutable flag (`dev-env -rm`) copies the current host directory to a temporary location and mounts it in the DE. The directory is then automatically deleted at the end of the session, therefore no changes are done to the host files.

## Packages I use
 - Command-line utilities: `zsh` `coreutils` `bsdmainutils` `colordiff`
 - Core development tools: `build-essential` `git`
 - Network tools: `wget` `curl` `nmap`
 - Development tools: `python` `ruby` (you are more than welcome to fork and add your own stack)
 - Compression libs and filesystem formats: `zlib` `liblzma` `liblzo2` `mtd-utils` `gzip` `bzip2` `tar` `arj` `lhasa` `p7zip` `p7zip-full` `cabextract` `cramfsprogs` `cramfsswap` `squashfs-tools` `sasquatch`
 - Image tools: `ImageMagick`
 - Digital forensics and penetration tools: `hydra` `john` `aircrack-ng` `sqlmap` `capstone` 
 - Privacy tools: `tor` `gpg` `gpg2`
 - Fun tools: `cowsay` `fortune` `sl`

## Installation
```
$ git clone https://github.com/kwketh/dev-env /opt/dev-env
$ echo "alias dev-env='/opt/dev-env/dev-env.sh'" >> ~/.bashrc
```

## Dependencies

 - docker.io (https://www.docker.com/)

## Contributions

You are more than welcome to contribute by forking the repository. You can configure the environment with your own set of packages, see [sh](sh/) directory to see how it is configured.

# License

The MIT License (MIT)

Copyright (c) 2014-2015 Konrad Wieczorek

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
