#!/bin/sh

cat /proc/cpuinfo | grep "physical id" | sort -u
lscpu | grep "CPU(s)"
nproc

#export DOTNET_gcServer=0

python3 ./Client/Client.py -U eduherminio -P "<pwd>" -S https://openbench.lynx-chess.com/ -T 3 -N 1 -I ob-worker-n

# https://vipinyadav.com/blog/scripts-run-in-background-using-screen-detached-mode/
# Create a new screen session: screen -S <session-name>. -S is short for session the name.
# To return to the main terminal session press Ctrl+A and then D.
# To return to the virtual screen session use command screen -r.
# To list the screen sessions run command screen -list.
# To choose a different screen session you can use pid or session name. Run screen -r <pid-or-session-name>