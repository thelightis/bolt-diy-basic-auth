#!/bin/sh

# Generate credentials file
htpasswd -cb /etc/nginx/auth/.htpasswd ${AUTH_USER:-admin} ${AUTH_PASSWORD:-railway}

# Apply configuration
cat /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Check nginx config
nginx -t

# Start nginx
exec nginx -g "daemon off;"