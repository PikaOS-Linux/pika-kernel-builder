#!/bin/bash

echo "Pika Kernel - Building"

make -j`nproc` bindeb-pkg LOCALVERSION=-pikaos KDEB_PKGVERSION=$(make kernelversion)-2
