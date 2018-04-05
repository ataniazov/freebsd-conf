#! /bin/sh

echo "Cleaning..."

# Clean browser data
rm -rf ~/.cache/chromium/ ~/.config/chromium/	#Chromium
rm -rf ~/.cache/mozilla/ ~/.mozilla/		#Firefox

# Wait 1 second
sleep 1

echo "Swaping with clean one..."

# Swap with clean data
tar -xvjf ~/Backup/.mozilla.tar.bz2 -C ~/ 

# Wait 1 second
sleep 1
