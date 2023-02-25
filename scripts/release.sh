#!/bin/bash

echo "Pika Kernel - Releasing Kernel"

# Sign the packages
dpkg-sig --sign builder ./output/linux-image*.deb
dpkg-sig --sign builder ./output/linux-headers*.deb
dpkg-sig --sign builder ./output/linux-tools*.deb

# Pull down existing ppa repo db files etc
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Copy over our gpg key in case it has been updated
cp ./output/key.gpg ./output/repo/key.gpg

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% linux-*-pikaos*)'

# Add the new package to the repo
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-image*.deb
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-headers*.deb
reprepro -V --basedir ./output/repo/ includedeb kinetic ./output/linux-tools*.deb

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
