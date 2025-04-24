#!/bin/bash

# Generate .htpasswd file with credentials defined in environment variables
htpasswd -cb /etc/nginx/auth/.htpasswd ${AUTH_USER:-admin} ${AUTH_PASSWORD:-railway}

# Process Nginx configuration template by substituting variables
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx service in background
service nginx start

# Run the default command of bolt.diy image to start the application
# Using exec to ensure it receives Docker signals correctly
exec yarn start