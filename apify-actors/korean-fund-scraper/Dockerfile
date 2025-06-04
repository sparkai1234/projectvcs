# Use the official Apify base image for Node.js
FROM apify/actor-node:18

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --only=prod

# Copy the source code
COPY . ./

# Run the actor
CMD node main.js 