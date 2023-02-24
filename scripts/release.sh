#!/bin/bash

echo "Pika Kernel - Releasing Kernel"

# Sign the packages
dpkg-sig --sign builder ./output/linux-image*.deb
dpkg-sig --sign builder ./output/linux-headers*.deb

rsync -azP --exclude '*.deb' ferreo@pika-os.com:/srv/www/pikappa/ ./output/repo

cp ./output/key.gpg ./output/repo/key.gpg

# Update the repo
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-image*.deb
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-headers*.deb

rsync -azP ./output/repo/ ferreo@pika-os.com:/srv/www/pikappa/
