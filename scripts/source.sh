#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.5-rc7.tar.gz
tar -xf ./linux-6.5-rc7.tar.gz

cd linux-6.5-rc7
