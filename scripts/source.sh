#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.3.tar.xz
tar -zxf ./linux-6.3.tar.xz

cd linux-6.3
