FROM node:18-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:18-alpine

WORKDIR /app

COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
COPY --from=build /app/src /app/src
COPY --from=build /app/package.json /app/package.json

RUN npm install -g nodemon

EXPOSE 3000

CMD npm start
