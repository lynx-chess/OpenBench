#!/bin/sh

cat /proc/cpuinfo | grep "physical id" | sort -u
lscpu | grep "CPU(s)"
nproc

python3 ./Client/Client.py -U eduherminio -P "<pwd>" -S https://openbench.lynx-chess.com/ -T 3 -N 1 -I ob-worker-n