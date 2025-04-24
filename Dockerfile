# Use a small Nginx base image
FROM nginx:alpine

# Install tools needed for password generation and environment variable substitution
RUN apk add --no-cache apache2-utils gettext

# Create directory to store password file
RUN mkdir -p /etc/nginx/auth

# Copy all configuration files and scripts
COPY nginx.conf /etc/nginx/conf.d/default.conf.template
COPY start.sh /start.sh

# Create folder for static files
RUN mkdir -p /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/

# Make script executable
RUN chmod +x /start.sh

# Set default environment variables
ENV AUTH_USER=admin
ENV AUTH_PASSWORD=railway

# Expose port 80
EXPOSE 80

# Start script when container starts
CMD ["/bin/sh", "/start.sh"]