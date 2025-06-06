FROM apify/actor-node:20

# Copy package files first for better Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . ./

# Run the actor
CMD npm start 