#!/bin/bash

## Core utils
apt-get install -y vim tar nano net-tools curl wget

## Classic tools
apt-get install -y lynx

## Prettier command-line utils
apt-get install -y colordiff

## Image utils
apt-get install -y ImageMagick

## Penetration tools
apt-get install -y hydra john nmap aircrack-ng 

# sqlmap
git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap

## Forensics tools
apt-get install -y binwalk

## Privacy tools
apt-get install -y tor gnupg
