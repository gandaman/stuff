#!/bin/sh
echo Hello from virtual machine -- running bootstrap.sh

sudo apt-get install -y mediatomb
sudo apt-get install -y libnfnetlink-dev
sudo apt-get install -y linux-headers-$(uname -r)

exit 0
