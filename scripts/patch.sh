#!/bin/bash

echo "Pika Kernel - Applying patches"

# Cachy patches are here: https://github.com/CachyOS/kernel-patches/
# orig patch from cachy - 0001-cachyos-base-all.patch
patch -Np1 < "../patches/0001-cachy-all.patch"
# orig patch from cachy
patch -Np1 < "../patches/0002-eevdf.patch"
# Linux-surface
patch -Np1 < "../patches/surface/*.patch"
# HDR patch - Currently broken against 6.3
#patch -Np1 < "../patches/0004-hdr.patch"
# Nintendo controller rumble patch
patch -Np1 < "../patches/0006-Nintendo-controller-one.patch"
# Nintendo controller BT patch
patch -Np1 < "../patches/0006-Nintendo-controller-two.patch"
# Nobara patches are here: https://github.com/sammilucia/nobara-kernel-fork
# Extra Leigon laptop goodies
patch -Np1 < "../patches/0001-Add-legion-laptop-v0.1.patch"
# Allow setting custom pollrates for usb devices
patch -Np1 < "../patches/0001-Allow-to-set-custom-USB-pollrate-for-specific-device.patch"
# Allow pre polaris cards to use the amdgpu kernel module
patch -Np1 < "../patches/amdgpu-si-cik-default.patch"
