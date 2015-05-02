#!/bin/bash

## Core utils
apt-get install -y vim tar nano net-tools curl wget

## Classic tools
apt-get install -y lynx

## Image utils
apt-get install -y ImageMagick

## Forensics and penetration tools
apt-get install -y hydra john nmap aircrack-ng 

# sqlmap
git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap

## Privacy tools
apt-get install -y tor gnupg

# torsocks-2.0.0
(
  rm `which torsocks`
  cd /tmp
  wget -O torsocks-2.0.0.tar.gz https://github.com/dgoulet/torsocks/archive/v2.0.0.tar.gz
  tar -xzf torsocks-2.0.0.tar.gz
  (
    cd torsocks-2.0.0
    ./autogen.sh && ./configure && make && sudo make install
  )
)


