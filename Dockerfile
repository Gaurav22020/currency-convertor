# ---------- Base Image ----------
FROM node:20-alpine

# ---------- App Directory ----------
WORKDIR /app

# ---------- Install Dependencies ----------
COPY package*.json ./
RUN npm install --omit=dev

# ---------- Copy Full Code ----------
COPY . .

# ---------- Expose Port ----------
EXPOSE 3000

# ---------- Start App ----------
CMD ["node", "server.js"]