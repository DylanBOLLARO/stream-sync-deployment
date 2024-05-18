#!/bin/bash

docker network create stream-sync
docker network create stream-sync-db
docker compose -f compose.dev.yml build 
docker compose -f compose.dev.yml up -d

cd stream-sync-scrapy
sh refresh_database.sh