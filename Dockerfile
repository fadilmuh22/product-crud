FROM node:20-alpine as prod

RUN apk add --no-cache openssl

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npx prisma generate && npm run build

CMD ["npm", "run", "start:prod"]

FROM node:20-alpine as dev

RUN apk add --no-cache openssl

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npx prisma generate

CMD ["npm", "run", "start:dev"]
