FROM apify/actor-node-playwright-chrome:20

# Copy source code
COPY . ./

# Install dependencies
RUN npm install --only=prod --no-optional

# Run the actor
CMD ["npm", "start"] 