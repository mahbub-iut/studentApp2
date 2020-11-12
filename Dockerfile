FROM node:12.16.1-alpine As builder

WORKDIR https://github.com/mahbub-iut/studentApp2/tree/master/src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder  https://github.com/mahbub-iut/studentApp2/tree/master/src/app/dist/studentApp/ /usr/share/nginx/html