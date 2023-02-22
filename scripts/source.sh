#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.2.tar.gz
tar -zxf ./linux-6.2.tar.gz

cd linux-6.2