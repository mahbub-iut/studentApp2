FROM node:12.16.1-alpine As builder

WORKDIR /src/app

COPY . .

RUN npm install && \
    npm run build
FROM nginx:alpine

COPY --from=builder /app/* /usr/share/nginx/html/

