FROM ubuntu:latest
MAINTAINER Konrad Wieczork <keth@kwketh.com>
ENV DEBIAN_FRONTEND noninteractive

# Not very pretty script but seems the only way
# to efficiently manage as few cached image and
# for the script to be reasonably maintainable
# to add new dependencies without long rebuild
# times.

# Install core dependencies
ADD ./sh/01_install_deps_core.sh /tmp/sh/01_install_deps_core.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/01_install_deps_core.sh

# Install user-custom development tools
ADD ./sh/02_install_deps_dev.sh /tmp/sh/02_install_deps_dev.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/02_install_deps_dev.sh

# Install zsh
ADD ./sh/03_setup_zsh.sh /tmp/sh/03_setup_zsh.sh 
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/03_setup_zsh.sh
ENV SHELL zsh

# Install binwalk (and all the additional dependencies)
ADD ./sh/04_install_binwalk.sh /tmp/sh/04_install_binwalk.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/04_install_binwalk.sh

# Install utils
ADD ./sh/05_install_utils.sh /tmp/sh/05_install_utils.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/05_install_utils.sh

# Install other fun tools
ADD ./sh/06_install_funtools.sh /tmp/sh/06_install_funtools.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/06_install_funtools.sh

# Setup dotfiles
ADD ./sh/07_setup_dotfiles.sh /tmp/sh/07_setup_dotfiles.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/07_setup_dotfiles.sh

# Setup directories
ADD ./sh/08_setup_dirs.sh /tmp/sh/08_setup_dirs.sh
RUN chmod +x /tmp/sh/*.sh && . /tmp/sh/08_setup_dirs.sh

ENTRYPOINT ["/bin/zsh"]

