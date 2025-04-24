# Bolt.diy with Basic Authentication

This is a Railway template that configures the bolt.diy application with Nginx basic authentication, protecting all endpoints behind a simple but effective login system.

## Features

- Bolt.diy application protected by Nginx with basic authentication
- Basic authentication for all endpoints (except health check)
- Health check endpoint for monitoring
- Easy configuration through environment variables
- Ready for deployment on Railway
- Based on the official `ghcr.io/stackblitz-labs/bolt.diy:sha-8116809` image

## Environment Variables

| Variable | Description | Default Value |
|----------|-------------|--------------|
| `AUTH_USER` | Username for basic authentication | `admin` |
| `AUTH_PASSWORD` | Password for basic authentication | `railway` |

## How to Use

### Deploy on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/your-template)

1. Click the "Deploy on Railway" button above
2. Configure your environment variables on Railway
3. Wait for deployment
4. Access the URL provided by Railway (login will be required with configured credentials)

### Local Execution

```bash
# Clone the repository
git clone https://github.com/your-username/protected-bolt-diy.git
cd protected-bolt-diy

# Run with Docker Compose
docker-compose up -d

# Access http://localhost:8080
# Use default credentials: admin/railway
```

## Project Structure

- `Dockerfile` - Container configuration
- `nginx.conf` - Nginx configuration
- `start.sh` - Startup script
- `.env.example` - Example environment variables
- `railway.json` - Railway configuration
- `docker-compose.yml` - Configuration for local execution
- `index.html` - Home page

## Security

This template uses basic authentication, which is suitable for many use cases but has limitations:

- Credentials are sent in Base64 (not encrypted)
- HTTPS is recommended (automatically provided by Railway)
- Consider adding rate limiting to prevent brute force attacks in production environments

## Customization

To customize the Nginx configuration:

1. Edit the `nginx.conf` file
2. Modify the `.env.example` file to include other variables
3. Update the `start.sh` script as needed

## License

MIT