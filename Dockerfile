FROM ubuntu:latest
MAINTAINER Konrad Wieczork <keth@kwketh.com>
ENV DEBIAN_FRONTEND noninteractive

# Update base tools
RUN apt-get update

# Development tools
RUN apt-get install -y build-essential git-core git

# Useful tools
RUN apt-get install -y coreutils curl tar nano net-tools wget

# Editor and themes
RUN apt-get install -y vim 

# Python
RUN apt-get install -y python python-dev python-pip

# Ruby
RUN apt-get install -y ruby ruby-dev

# Classic fun tools
RUN apt-get install -y cowsay fortune sl
ENV PATH $PATH:/usr/games

# zsh
RUN apt-get install -y zsh && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
ENV SHELL zsh

# dotfiles
ADD dotfiles /root
