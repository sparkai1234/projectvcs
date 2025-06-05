# Use the official Apify Node.js base image with Playwright support
FROM apify/actor-node-playwright:16

# Copy package files
COPY package*.json ./

# Install NPM packages
RUN npm --quiet set progress=false \
    && npm install --only=prod --no-optional \
    && echo "Installed NPM packages:" \
    && (npm list --only=prod --no-optional --all || true) \
    && echo "Node.js version:" \
    && node --version \
    && echo "NPM version:" \
    && npm --version

# Install Playwright browsers
RUN npx playwright install --with-deps

# Copy source code and set working directory
COPY . ./

# Expose the port the app runs on
EXPOSE 4321

# Run the actor
CMD npm start 