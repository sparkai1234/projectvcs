FROM apify/actor-node-playwright-chromium:18
COPY package.json ./
RUN npm install
COPY . ./
CMD npm start 