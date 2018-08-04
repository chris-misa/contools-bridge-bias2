#!/bin/bash

#
# Install / build / configure for overheads ping performance test
#
# Run as sudo
#

# Copy in config files
mkdir /etc/docker
cp config/daemon /etc/docker/
cp config/ndppd.conf /etc/

# Get dependencies for host system from deb
apt-get update
apt-get install -y libcap-dev libidn2-0-dev nettle-dev
apt-get install -y docker.io tmux ndppd

# Pull needed containers from docker hub
docker pull chrismisa/contools:ping

# Download and make iputils (which contains our version of ping)
git clone https://github.com/iputils/iputils.git
pushd iputils
make
popd

