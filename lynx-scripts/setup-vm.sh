#!/bin/sh

# sudo apt-get update && sudo apt-get install -y dos2unix && dos2unix setup-vm.sh && chmod +x setup-vm.sh

cat /proc/cpuinfo | grep "physical id" | sort -u
lscpu | grep "CPU(s)"
nproc

sudo apt-get update
sudo apt-get install -y git make python3-pip

git clone https://github.com/lynx-chess/OpenBench
cd OpenBench/Client/credentials
pip install -r requirements.txt

nano OpenBench/Client/credentials.lynx				# Engine PAT
nano connect.sh										# Connect script
mkdir OpenBench/Client/Engines
nano OpenBench/Client/Engines/appsettings.json 		# Logging settings

# .NET setup
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0

# Lynx setup
echo '<pat>' > OpenBench/Client/credentials.lynx                        # Engine PAT
cp OpenBench/Client/lynx-scripts/start-client.sh    ./connect.sh        # Connect script
chmod +x connect.sh

mkdir OpenBench/Client/Engines
nano OpenBench/Client/Engines/appsettings.json 		                    # Logging settings

export DOTNET_gcServer=0
python3 Client.py -U eduherminio -P "<pwd>" -S https://openbench.lynx-chess.com/ -T 2 -N 1 -I ob-worker-<n>
