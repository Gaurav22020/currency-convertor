# Use newer Node LTS
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only dependency files first
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy remaining files
COPY . .

# Expose app port
EXPOSE 3000

# Run as non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Start app
CMD ["npm", "start"]