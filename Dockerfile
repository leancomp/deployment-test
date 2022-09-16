FROM node:14-alpine as builder
WORKDIR /app

COPY package*.json /app/
RUN npm ci --omit=dev

COPY . .
RUN npm run build

FROM ghcr.io/astefanutti/scratch-node:14 as final
WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules/ node_modules

ENTRYPOINT ["node", "index.js"]