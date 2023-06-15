#!/bin/bash

echo "Pika Kernel - Applying patches"

# Cachy patches are here: https://github.com/CachyOS/kernel-patches/
# orig patch from cachy - 0001-cachyos-base-all.patch
patch -Np1 < "../patches/0001-cachy-all.patch"
# orig patch from cachy
patch -Np1 < "../patches/0002-eevdfbore.patch"
# orig patch from cachy
patch -Np1 < "../patches/0003-bore.patch"
# Nobara patches are here: https://github.com/sammilucia/nobara-kernel-fork
# Allow setting custom pollrates for usb devices
patch -Np1 < "../patches/0004-Allow-to-set-custom-USB-pollrate-for-specific-device.patch"
# Allow pre polaris cards to use the amdgpu kernel module
patch -Np1 < "../patches/0005-amdgpu-si-cik-default.patch"
