# Sign the packages
dpkg-sig --sign builder ./output/*.deb

# Pull down existing ppa repo db files etc
rsync -azqP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

wget -nv https://launchpad.net/ubuntu/+archive/primary/+files/reprepro_5.3.0-1.4_amd64.deb
dpkg -i reprepro_5.3.0-1.4_amd64.deb

# Add the new package to the repo
reprepro -V --basedir ./output/repo/ includedeb lunar ./output/*.deb

# Push the updated ppa repo to the server
rsync -azqP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
