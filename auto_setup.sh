#!/bin/bash

docker compose -f compose.dev.yml build 
docker compose -f compose.dev.yml up -d

cd stream-sync-scrapy
sh refresh_database.sh