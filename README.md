# LighterPack Docker

A modern Docker image build for [LighterPack](https://github.com/galenmaly/lighterpack) - a self-hosted gear tracking app for hikers and adventurers.

## Quick Start

```bash
git clone https://github.com/datyk/lighterpack-docker.git
cd lighterpack-docker
docker compose up -d --build
```

The app will be available at `http://localhost:8080`.

## Architecture

- **App**: Node.js 18 Alpine - LighterPack web application
- **Database**: MongoDB 7 - persistent data storage

## Configuration

Edit `config/local.json` to customize:
- `deployUrl` / `publicUrl`: Your public-facing URL
- `port`: Internal app port (default: 3000)
- `databaseUrl`: MongoDB connection string

## Ports

| Service | Internal | External |
|---------|----------|----------|
| App     | 3000     | 8080     |
| MongoDB | 27017    | -        |
