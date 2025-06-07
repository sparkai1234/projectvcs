# Use the official Apify base image with Puppeteer support
FROM apify/actor-node-puppeteer-chrome:18

# Copy package files
COPY package*.json ./

# Install npm dependencies
RUN npm ci --omit=dev --omit=optional

# Copy source code
COPY . ./

# Expose the port the app runs on
EXPOSE 4321

# Run the scraper
CMD npm start 