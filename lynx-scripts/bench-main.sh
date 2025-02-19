#!/bin/sh

cat /proc/cpuinfo | grep "physical id" | sort -u
lscpu | grep "CPU(s)"
nproc

export DOTNET_gcServer=0

python3 ~/OpenBench/Scripts/bench_all.py -U eduherminio -P "<pwd>" -S https://openbench.lynx-chess.com/ --rebuild --threads 4  --sets 10