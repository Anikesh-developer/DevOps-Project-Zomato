# Stage 1: Build stage
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build   # assumes your app has a build script

# Stage 2: Production stage
FROM node:20-slim

WORKDIR /app

EXPOSE 3000

CMD ["node", "index.js"]
