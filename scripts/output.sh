#!/bin/bash

echo "Pika Kernel - Copying Output"

cd ..
rm ./linux-libc*.deb

for f in *.deb; 
do
    cp $f ./output/$f
done
