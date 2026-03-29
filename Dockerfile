FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .

FROM node:20-alpine

WORKDIR /app
RUN apk update && apk upgrade --no-cache

COPY --from=builder /app /app

RUN npm prune --omit=dev

EXPOSE 3000
CMD ["npm", "start"]