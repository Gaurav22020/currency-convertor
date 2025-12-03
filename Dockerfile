# 1. Use official Node image
FROM node:18-alpine

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy package.json and package-lock.json first (better caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the project files
COPY . .

# 6. Expose the port your app runs on (e.g., 3000)
EXPOSE 3000

# 7. Start the application
CMD ["npm", "start"]
