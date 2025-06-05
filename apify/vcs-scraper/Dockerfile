# Use the most reliable Apify base image
FROM apify/actor-node:16

# Copy package files
COPY package*.json ./

# Install NPM packages including Playwright
RUN npm --quiet set progress=false \
    && npm install --only=prod --no-optional \
    && echo "Installed NPM packages:" \
    && (npm list --only=prod --no-optional --all || true) \
    && echo "Node.js version:" \
    && node --version \
    && echo "NPM version:" \
    && npm --version

# Install Playwright browsers after NPM packages
RUN npx playwright install

# Copy source code and set working directory
COPY . ./

# Expose the port the app runs on
EXPOSE 4321

# Run the actor
CMD npm start 