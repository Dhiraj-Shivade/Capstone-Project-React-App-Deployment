# Use the official Node.js 14 Alpine image
FROM nginx:alpine

# Working directory
WORKDIR /usr/share/nginx/html/

# Copy the remaining application code
COPY . .

## Expose the port the app runs on i.e. port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]