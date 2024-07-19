FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm сш

COPY . .

RUN npm run build

CMD [ "npm", "start" ]

EXPOSE 3000
