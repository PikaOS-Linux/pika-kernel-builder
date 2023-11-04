#!/bin/bash

echo "Pika Kernel - Getting source"

wget -nv https://cdn.kernel.org/pub/linux/kernel/v"$(echo $(cat ./VERSION) | cut -f1 -d".")".x/linux-"$(cat ./VERSION)".tar.gz
tar -xf ./linux-"$(cat ./VERSION)".tar.gz

cd linux-"$(cat ./VERSION)"
