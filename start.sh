#!/bin/bash
set -e

echo "Generating .htpasswd file with credentials..."
htpasswd -cb /etc/nginx/auth/.htpasswd ${AUTH_USER:-admin} ${AUTH_PASSWORD:-railway}

echo "Configuring Nginx with APP_HOST=${APP_HOST} and APP_PORT=${APP_PORT}..."
export APP_HOST=${APP_HOST:-bolt-diy}
export APP_PORT=${APP_PORT:-5173}
envsubst '$APP_HOST $APP_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Test Nginx config
nginx -t

echo "Starting Nginx in foreground..."
exec nginx -g "daemon off;"