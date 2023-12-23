#!/bin/sh

sudo docker compose -f docker-compose.prod.yaml up -d --build --force-recreate && sudo chown -R $(sudo docker compose exec web id -u) ./db && sudo chown -R $(sudo docker compose exec web id -u) ./media && sudo chown -R $(sudo docker compose exec web id -u) ./OpenBench/migrations