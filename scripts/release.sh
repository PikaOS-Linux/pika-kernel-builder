#!/bin/bash

echo "Pika Kernel - Releasing Kernel"

# Sign the packages
dpkg-sig --sign builder ./output/linux-image*.deb
dpkg-sig --sign builder ./output/linux-headers*.deb

# Update the repo
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-image*.deb
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-headers*.deb

rsync -azP ./output/repo/ ferreo@pika-os.com:/srv/www/pikappa/