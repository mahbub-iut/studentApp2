FROM node:12.16.1-alpine As builder

WORKDIR src/app

COPY package.json package-lock.json ./


COPY . .

RUN npm install && \
    npm run build

FROM nginx:1.15.8-alpine

COPY --from=builder  /src/app/dist/studentApp2/ /usr/share/nginx/html


