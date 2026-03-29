# ---------- Builder ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev

COPY . .

# ---------- Production ----------
FROM node:20-alpine

WORKDIR /app

RUN apk update && apk upgrade --no-cache

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./
COPY --from=builder /app/*.js ./

EXPOSE 3000
CMD ["node", "server.js"]