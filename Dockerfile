FROM node:20-alpine

RUN apk add --no-cache openssl

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

CMD ["sh", "-c", "npx prisma generate && npm run start:dev"]
