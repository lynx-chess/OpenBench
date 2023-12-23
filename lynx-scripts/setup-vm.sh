#!/bin/sh

# sudo apt-get update && sudo apt-get install -y dos2unix && dos2unix setup-vm.sh && chmod +x setup-vm.sh

sudo apt-get update
sudo apt-get install -y git make python3-pip

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 8.0.1xx --quality preview --install-dir ~/dotnet
echo 'export DOTNET_ROOT=$HOME/dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/lynx-chess/OpenBench
cd OpenBench/Client
python3 -m pip install -r requirements.txt

cat /proc/cpuinfo | grep "physical id" | sort -u
lscpu | grep "CPU(s)"
nproc

echo '<pat>' > credentials.lynx
python3 Client.py -U eduherminio -P "<pwd>" -S https://openbench.lynx-chess.com/ -T 2 -N 1 -I ob-worker-<n>