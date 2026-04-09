# Stage 1: Build frontend assets
FROM node:18-alpine AS builder

WORKDIR /app

# Clone the LighterPack source
RUN apk add --no-cache git && \
    git clone --depth 1 https://github.com/galenmaly/lighterpack.git .

# Install all dependencies (including devDependencies for webpack build)
RUN npm install

# Build the webpack frontend bundle
RUN npx webpack-cli --config ./webpack.config.js

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy source from builder
COPY --from=builder /app .

# Remove devDependencies to slim down
RUN npm prune --production

EXPOSE 3000

CMD ["node", "app.js"]
