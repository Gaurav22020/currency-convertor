FROM node:20-alpine

WORKDIR /app

# Update OS packages
RUN apk update && apk upgrade --no-cache

# Copy only dependency files first
COPY package*.json ./

# Clean install (deterministic)
RUN npm ci --omit=dev

# Now copy rest of code
COPY . .

EXPOSE 3000

CMD ["npm", "start"]