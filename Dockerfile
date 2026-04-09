# Stage 1: Build frontend assets
FROM node:18-alpine AS builder

WORKDIR /app

# Clone the LighterPack source
RUN apk add --no-cache git python3 make g++ && \
    git clone --depth 1 https://github.com/galenmaly/lighterpack.git .

# Install all dependencies
RUN npm install

# Build the webpack frontend bundle
RUN npx webpack-cli --config ./webpack.config.js

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy everything from builder (including node_modules)
COPY --from=builder /app .

EXPOSE 3000

ENTRYPOINT []
CMD ["node", "app.js"]
