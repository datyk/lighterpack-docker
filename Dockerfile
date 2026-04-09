# Single-stage build to ensure webpack output stays in place
FROM node:18-alpine

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache git python3 make g++

# Clone the LighterPack source
RUN git clone --depth 1 https://github.com/galenmaly/lighterpack.git .

# Install all dependencies
RUN npm install

# Create output directory and build frontend
RUN mkdir -p /app/public/dist && npx webpack-cli --config ./webpack.config.js

# Clean up build-only system packages
RUN apk del git python3 make g++

EXPOSE 3000

CMD ["node", "app.js"]
