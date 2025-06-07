# Use Playwright-enabled Node.js base image
FROM apify/actor-node-playwright-chrome:18

# Set Korean locale support
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8

# Copy package files first for better Docker caching
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production --no-audit

# Install Korean fonts for better rendering
RUN apt-get update && apt-get install -y \
    fonts-nanum \
    fonts-nanum-coding \
    fonts-nanum-extra \
    && rm -rf /var/lib/apt/lists/*

# Copy source code
COPY . ./

# Set the start command
CMD npm start 