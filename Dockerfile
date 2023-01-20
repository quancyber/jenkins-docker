FROM node:18.13.0-alpine3.9

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

EXPOSE 8080

COPY . .

CMD ["npm", "start"]
