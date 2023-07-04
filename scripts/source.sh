#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.1.tar.xz
tar -xf ./linux-6.4.1.tar.gz

cd linux-6.4.1
