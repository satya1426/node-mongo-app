FROM node:18

WORKDIR /app

RUN npm install -g npm@9

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
