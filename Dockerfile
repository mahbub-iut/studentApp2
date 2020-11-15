FROM node:alpine AS builder

WORKDIR src/app

COPY . .

RUN npm install && \
    npm run build
FROM nginx:alpine

COPY --from=builder src/app/* /usr/share/nginx/html/

