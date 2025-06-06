# Use Apify base image with Puppeteer Chrome pre-installed
FROM apify/actor-node-puppeteer-chrome:18

# Copy package files from the diva-scraper directory
COPY apify/diva-scraper/package*.json ./

# Install dependencies with proper npm flags
RUN npm ci --only=production --no-optional \
    && echo "Installed NPM packages:" \
    && (npm list --only=production --no-optional --all || true) \
    && echo "Node.js version:" \
    && node --version \
    && echo "NPM version:" \
    && npm --version

# Copy source code from diva-scraper directory
COPY apify/diva-scraper/ ./

# Expose the port the app runs on
EXPOSE 4321

# Run the actor
CMD npm start 