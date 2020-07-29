FROM node:lts-alpine

EXPOSE 8080

WORKDIR /app

COPY src/vue/frontend/package*.json ./

RUN set -eux; \
    npm install; \
    npm install -g http-server; \
    npm install --save auth0-js eventemitter3 axios

COPY src/vue/frontend ./

RUN npm run build

CMD [ "http-server", "dist" ]
