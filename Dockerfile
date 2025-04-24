# Use the specific bolt.diy image as base
FROM ghcr.io/stackblitz-labs/bolt.diy:sha-8116809

# Install tools needed for password generation and environment variable substitution
RUN apt-get update && apt-get install -y apache2-utils gettext-base && rm -rf /var/lib/apt/lists/*

# Create directory to store password file
RUN mkdir -p /etc/nginx/auth

# Copy .env.example file to container
COPY .env.example /app/.env.example

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
CMD ["/bin/bash", "/start.sh"]