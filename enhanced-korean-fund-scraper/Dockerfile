FROM node:18-alpine

COPY package*.json ./
RUN npm install --omit=dev
COPY . ./

CMD node main.js 