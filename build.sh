#!/bin/bash
#
# Copyright (c) 2011, Joyent Inc., All rights reserved.
#

for dir in seabios vgabios kvm/test; do
    cp roms/${dir}/config.mak.tmpl roms/${dir}/config.mak
done

#
# Temporairly removed
# 
#   --enable-kvm \
#   --enable-kvm-pit \
#

echo "==> Running configure"
./configure \
    --prefix=. \
    --audio-card-list= \
    --audio-drv-list= \
    --disable-bluez \
    --disable-brlapi \
    --disable-curl \
    --enable-debug \
    --disable-kvm-device-assignment \
    --disable-sdl \
    --disable-vnc-jpeg \
    --disable-vnc-png \
    --disable-vnc-sasl \
    --disable-vnc-tls \
    --kerneldir=$(cd `pwd`/../kvm; pwd) \
    --cpu=x86_64

echo "==> Make"
gmake -j10
