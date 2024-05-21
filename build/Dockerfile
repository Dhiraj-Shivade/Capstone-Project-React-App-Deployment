# Use the official Node.js 14 Alpine image
FROM node:14-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining application code
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on i.e. port 80
EXPOSE 80