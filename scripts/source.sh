#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.6.tar.gz
tar -xf ./linux-6.4.6.tar.gz

cd linux-6.4.6
