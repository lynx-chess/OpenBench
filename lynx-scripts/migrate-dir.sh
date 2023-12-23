#!/bin/sh

cp OpenBench_old/db/lynx-ob.sqlite3 OpenBench/db/
cp OpenBench_old/.env OpenBench/.env
cp OpenBench_old/.env.prod OpenBench/.env.prod
cp OpenBench_old/credentials.lynx OpenBench/credentials.lynx
sudo cp -r OpenBench_old/certs OpenBench/