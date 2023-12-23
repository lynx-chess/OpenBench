python3 OpenBench/Client/client.py `
	-S https://openbench.lynx-chess.com/ `
	-U "<user>" `
	-P "<pwd>" `
	-T 8 `
	-N 1 `
	-I mini-worker-1
| tee ob-client.txt