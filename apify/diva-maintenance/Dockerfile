# Enhanced DIVA Maintenance System v2.0 Dockerfile
# Optimized for Korean financial data maintenance operations

FROM apify/actor-node-puppeteer-chrome:18

# Set Korean locale support
ENV LANG=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8

# Copy actor files
COPY package*.json ./
RUN npm --quiet set progress=false \
    && npm install --only=prod --no-optional \
    && echo "Installed NPM packages:" \
    && (npm list --only=prod --no-optional --all || true) \
    && echo "Node.js version:" \
    && node --version \
    && echo "NPM version:" \
    && npm --version \
    && rm -r ~/.npm

COPY . ./

# Run the actor
CMD npm start 