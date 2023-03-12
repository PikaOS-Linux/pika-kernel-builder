#!/bin/bash

echo "Pika Kernel - Applying patches"

# Cachy patches are here: https://github.com/CachyOS/kernel-patches/
# orig patch from cachy - 0001-cachyos-base-all.patch
patch -Np1 < "../patches/0001-cachy-all.patch"
# orig patch from cachy - 0001-Add-latency-priority-for-CFS-class.patch
patch -Np1 < "../patches/0002-cfs-nice.patch"
# orig patch from cachy
patch -Np1 < "../patches/0003-eevdf.patch"
# orig patch from cachy - 0001-bore-eevdf.patch
patch -Np1 < "../patches/0004-bore.patch"
# HDR patch - from cachy (but they deleted it)
patch -Np1 < "../patches/0005-hdr.patch"
# Nobara patches are here: https://github.com/sammilucia/nobara-kernel-fork
# Extra Leigon laptop goodies
patch -Np1 < "../patches/0001-Add-legion-laptop-v0.1.patch"
# Allow setting custom pollrates for usb devices
patch -Np1 < "../patches/0001-Allow-to-set-custom-USB-pollrate-for-specific-device.patch"
# Allow pre polaris cards to use the amdgpu kernel module
patch -Np1 < "../patches/amdgpu-si-cik-default.patch"
# Disable mt76 buggy aspm
patch -Np1 < "../patches/mt76_-mt7921_-Disable-powersave-features-by-default.patch"
# Make PS4 controllers have 1000hz pollrate over bluetooth like the actual console
patch -Np1 < "../patches/set-ps4-bt-poll-rate-1000hz.patch"
