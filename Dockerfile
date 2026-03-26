FROM node:18-alpine3.19

# create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# install dependencies first (layer caching)
COPY package*.json ./

# install only production deps
RUN npm ci --only=production && npm cache clean --force

# copy app
COPY . .

# update OS packages (security patches)
RUN apk update && apk upgrade

# change ownership
RUN chown -R appuser:appgroup /app

# switch to non-root user
USER appuser

EXPOSE 3000

CMD ["node", "app.js"]
