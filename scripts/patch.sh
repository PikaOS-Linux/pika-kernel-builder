#!/bin/bash

echo "Pika Kernel - Applying patches"

# Cachy patches are here: https://github.com/CachyOS/kernel-patches/
# orig patch from cachy - 0001-cachyos-base-all.patch
patch -Np1 < "../patches/0001-cachy-all.patch"
# orig patch from cachy - 0001-Add-latency-priority-for-CFS-class.patch
patch -Np1 < "../patches/0002-cfs-nice.patch"
# orig patch from cachy - 0001-bore-cachy.patch
patch -Np1 < "../patches/0003-bore.patch"
# HDR patch - from cachy (but they deleted it)
patch -Np1 < "../patches/0004-hdr.patch"