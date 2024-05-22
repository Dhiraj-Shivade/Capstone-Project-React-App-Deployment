# Use the official nginx image
FROM nginx

# Working directory
WORKDIR /usr/share/nginx/html

# Copy the application code
COPY . .

## Expose the port the app runs on i.e. port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]