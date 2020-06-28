FROM node:lts-alpine

WORKDIR /src

COPY src/frontend/package*.json ./

RUN npm install

CMD [ "npm", "run", "dev" ]
