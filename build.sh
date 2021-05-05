#!/bin/bash
# debian: sudo apt install build-essential dh-make dh-autoreconf intltool libgtk2.0-dev libgtk-3-dev libgtk-4-dev
# fedora: sudo dnf install autoconf automake gtk2-devel gtk3-devel gtk4-devel desktop-file-utils
# opensuse: sudo zypper install autoconf automake gtk2-devel gtk3-devel gtk4-devel desktop-file-utils

# remove old builds
rm -f awf-gtk2 awf-gtk3 awf-gtk4

# copy to a tmp directory
mkdir builder builder/src
touch builder/ChangeLog
touch builder/NEWS
touch builder/AUTHORS
touch builder/README
cp /usr/share/common-licenses/GPL-3 builder/COPYING
cp configure.ac    builder/
cp Makefile.am     builder/
cp src/Makefile.am builder/src/
cp src/awf.c       builder/src/

# build
cd builder/
autoreconf -f -i
./configure
make

# final
cp src/awf-gtk* ..
cd ..
ls -altrh awf-gtk4 awf-gtk3 awf-gtk2
rm -rf builder/