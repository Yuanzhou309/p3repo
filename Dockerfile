FROM node:16 AS builder
# Above, we set the base image for this first stage as a light weigh node

WORKDIR './app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

RUN chmod + x /docker-entrypoint.sh
