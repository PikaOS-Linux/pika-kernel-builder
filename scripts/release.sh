#!/bin/bash

echo "Pika Kernel - Releasing Kernel"

# Sign the packages
dpkg-sig --sign builder ./output/linux-image*.deb
dpkg-sig --sign builder ./output/linux-headers*.deb
echo "Pika Kernel - Package sign complete"

# Pull down existing ppa repo db files etc
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo
echo "Pika Kernel - Repo rsync pull complete"

# Remove our existing package from the repo - only for current version so we can update it
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% linux-*-6.3.0-pikaos*)'
echo "Pika Kernel - Repo clean complete"

# Add the new package to the repo
reprepro -V --basedir ./output/repo/ includedeb lunar ./output/linux-image*.deb
reprepro -V --basedir ./output/repo/ includedeb lunar ./output/linux-headers*.deb
echo "Pika Kernel - Repo update complete"

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
echo "Pika Kernel - Repo rsync push complete"
