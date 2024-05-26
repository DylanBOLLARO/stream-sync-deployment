## Development

```bash
git clone --recurse-submodules https://github.com/DylanBOLLARO/stream-sync-deployment
```

First, run the development server:

```bash
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create stream-sync &&
docker network create stream-sync-db

# Build dev
docker compose -f compose.dev.yml build

# Up dev in detached mode
docker compose -f compose.dev.yml up -d
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

Synchronize PRISMA schema with postgresql, and add data

```bash
cd stream-sync-scrapy
sh refresh_database.sh
```

start auto setup

```bash
cd stream-sync-scrapy
sh refresh_database.sh
```

## Useful commands

```bash
# Stop all running containers
docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

# Free space
docker system prune -af --volumes
```

```bash
docker volume rm $(docker volume ls -q)
```
