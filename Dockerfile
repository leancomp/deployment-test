FROM node:14-alpine as builder
WORKDIR /app

COPY package*.json /app/
RUN npm ci --omit=dev

COPY . .
RUN npm run build

FROM ghcr.io/astefanutti/scratch-node:14 as final
WORKDIR /app

COPY --from=builder /app/package*.json ./

ENTRYPOINT ["node", "index.js"]