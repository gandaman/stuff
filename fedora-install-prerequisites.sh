#!/bin/bash

sudo yum install -y \
gawk \
gcc \
gcc-c++ \
patch \
gawk \
wget \
git-core \
diffstat \
unzip \
texinfo \
chrpath \
xterm \
chrpath \
perl-Thread-Queue \
pulseaudio-libs \
pulseaudio-libs-devel  \
SDL-devel 

# Safe exit if script was sourced
return 2>/dev/null || exit

# Ubuntu names
build-essential
libsdl1.2-dev \
