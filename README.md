## Prerequisites

Install [Docker Desktop](https://docs.docker.com/get-docker) for Mac, Windows, or Linux. Docker Desktop includes Docker
Compose as part of the installation.

## Development

First, run the development server:

```bash
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create stream-sync

docker network create stream-sync-db


# Build dev
docker compose -f compose.dev.yml build

# Up dev in detached mode
docker compose -f compose.dev.yml up -d
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Production

Multistage builds are highly recommended in production. Combined with the Next
[Output Standalone](https://nextjs.org/docs/advanced-features/output-file-tracing#automatically-copying-traced-files)
feature, only `node_modules` files required for production are copied into the final Docker image.

First, run the production server (Final image approximately 110 MB).

```bash
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create stream-sync

docker network create stream-sync-db

# Build prod
docker compose -f docker-compose.prod.yml build

# Up prod in detached mode
docker compose -f docker-compose.prod.yml up -d
```

Synchronize PRISMA schema with postgresql

```bash
docker exec -ti stream-sync-backend sh
```

```bash
npx prisma db push --force-reset
```

```bash
exit
```

Synchronize PRISMA schema with postgresql

```bash
docker exec -ti stream-sync-backend sh
```

```bash
npx prisma db push --force-reset
```

```bash
exit
```

## Useful commands

```bash
# Stop all running containers
docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

# Free space
docker system prune -af --volumes
```
