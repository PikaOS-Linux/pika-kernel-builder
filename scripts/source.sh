#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.5.tar.gz
tar -xf ./linux-6.5.5.tar.gz

cd linux-6.5.5
