#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://git.kernel.org/torvalds/t/linux-6.4-rc6.tar.gz
tar -xf ./linux-6.4-rc6.tar.gz

cd linux-6.4-rc6
