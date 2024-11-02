# Use an official Nginx image to serve the static site
FROM nginx:alpine

# Copy the build files to the Nginx HTML directory
COPY build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

