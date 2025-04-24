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

## Testing

To test the setup:

1. **Local testing with Docker Compose:**
   ```bash
   # Build and start the container
   docker-compose up -d
   
   # Access through the protected Nginx gateway
   # Visit http://localhost:8080 in your browser
   # You'll be prompted for authentication credentials (default: admin/railway)
   ```

2. **Testing direct access to Bolt.diy:**
   If you need to test the Bolt.diy application directly without the authentication layer:
   ```bash
   # Access the Bolt.diy application directly on its native port
   # Visit http://localhost:5173 in your browser
   ```

3. **Testing Railway deployment:**
   - After deploying to Railway, visit the provided URL
   - You'll be prompted for the authentication credentials you configured in Railway

4. **API Request Testing:**
   ```bash
   # Test without authentication (should fail)
   curl http://localhost:8080/
   
   # Test with authentication (should succeed)
   curl -u admin:railway http://localhost:8080/
   
   # Test health endpoint (should work without authentication)
   curl http://localhost:8080/health
   ```

## Architecture

This template uses a two-container approach:

1. **Nginx Auth Container**: A lightweight Nginx container that handles basic authentication
2. **Bolt.diy Container**: The unmodified official bolt.diy container

This approach completely avoids the package manager issues by keeping the bolt.diy container unchanged and adding authentication through a separate proxy container.

## Customization

To customize the Nginx configuration:

1. Edit the `nginx.conf` file
2. Modify the `.env.example` file to include other variables
3. Update the `start.sh` script as needed

## License

MIT