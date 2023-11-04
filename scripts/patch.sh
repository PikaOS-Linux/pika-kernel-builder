#!/bin/bash

echo "Pika Kernel - Applying patches"

for i in $(cat ../patches/series | grep -v '^#') ; do echo "Applying Patch: $i" && patch -Np1 -i ../patches/$i || bash -c "echo "Applying Patch $i Failed!" && exit 2"; done
