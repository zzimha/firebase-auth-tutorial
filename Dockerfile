# Base image with Node preinstalled
FROM node:16-alpine
# All later commands run in this folder
WORKDIR /usr/src/app
# Copy dependency files first (layer cache)
COPY package*.json ./
RUN npm ci
# Then copy the source code
COPY . .
# Port used by the dev server
EXPOSE 3000
# Listen on all interfaces, not just localhost
ENV HOST=0.0.0.0
CMD ["npm", "start"]
