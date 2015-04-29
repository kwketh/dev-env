FROM ubuntu:latest
MAINTAINER Konrad Wieczork <keth@kwketh.com>
ENV DEBIAN_FRONTEND noninteractive

# Not very pretty script but seems the only way
# to efficiently manage as few cached image and
# for the script to be reasonably maintainable
# to add new dependencies without long rebuild
# times.

# Install core dependencies
ADD ./sh/install_deps_core.sh /tmp/sh/install_deps_core.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/install_deps_core.sh

# Install user-custom development tools
ADD ./sh/install_deps_dev.sh /tmp/sh/install_deps_dev.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/install_deps_dev.sh

# Install zsh
ADD ./sh/setup_zsh.sh /tmp/sh/setup_zsh.sh 
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/setup_zsh.sh
ENV SHELL zsh

# Install utils
ADD ./sh/install_utils.sh /tmp/sh/install_utils.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/install_utils.sh

# Install other fun tools
ADD ./sh/install_funtools.sh /tmp/sh/install_funtools.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/install_funtools.sh

# Setup dotfiles
ADD ./sh/setup_dotfiles.sh /tmp/sh/setup_dotfiles.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/setup_dotfiles.sh

# Setup directories
ADD ./sh/setup_dirs.sh /tmp/sh/setup_dirs.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/setup_dirs.sh

ENTRYPOINT ["/bin/zsh"]

