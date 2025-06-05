# Use Apify base image with Playwright browsers pre-installed
FROM apify/actor-node:18

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm --quiet set progress=false \
    && npm install --only=prod --no-optional \
    && echo "Installed NPM packages:" \
    && (npm list --only=prod --no-optional --all || true) \
    && echo "Node.js version:" \
    && node --version \
    && echo "NPM version:" \
    && npm --version

# Browser binaries are already installed in the base image
# No need for separate npx playwright install

# Copy source code and set working directory
COPY . ./

# Expose the port the app runs on
EXPOSE 4321

# Run the actor
CMD npm start 