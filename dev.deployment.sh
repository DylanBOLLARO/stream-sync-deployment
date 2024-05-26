#!/bin/bash

docker compose -f compose.prod.yml build 
docker compose -f compose.prod.yml up -d

docker exec -ti stream-sync-backend npx prisma db push --force-reset

cd stream-sync-scrapy
sh up_database.sh
