#!/bin/bash

echo "Pika Kernel - Copying Output"

cd ..
mkdir ./output
rm ./linux-libc*.deb
cp ./*.deb ./output/