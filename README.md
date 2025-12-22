<div align="center">
   <img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/7f83b57c-4dfa-46f1-87cf-81cdb0a21f09" />
   <h1>Saturn - Self-Hosted Internet</h1>
</div>


A complete offline internet ecosystem built with Docker containers. This project provides access to knowledge, development tools, entertainment, and infrastructure services without requiring external internet connectivity.

## What is this?

This is a **self-hosted internet project** that creates a local network with various services to provide:

- **Knowledge & Documentation** - Wikipedia, developer documentation, wikis
- **Development Tools** - Git repositories, file management, PDF tools
- **Entertainment** - Media streaming with Jellyfin
- **AI Services** - Local AI models and chat interfaces
- **Infrastructure** - Password management, DNS filtering, ad-blocking

Perfect for environments with limited or no internet connectivity, or for users who want privacy and control over their digital resources.

## Features

### Knowledge & Documentation

- **Wikipedia & DevDocs** (`wiki.localhost`) - 115GB of offline content including 225+ documentation sets
- **BookStack** (`notes.localhost`) - Documentation and wiki platform
- **PDF Tools** (`pdf.localhost`) - PDF manipulation and conversion tools

### AI Services

- **LM Studio** (`localhost:1234`) - Local AI model hosting
- **Open WebUI** (`localhost:8084`) - Chat interface for AI models

### Development Tools

- **Gitea** (`git.localhost`) - Git repository hosting
- **FileBrowser** (`files.localhost`) - File management interface

### Entertainment

- **Jellyfin** (`media.localhost`) - Media streaming server

### Infrastructure

- **Vaultwarden** (`vault.localhost`) - Password manager (Bitwarden-compatible)
- **AdGuard Home** (`dns.localhost`) - DNS server with ad-blocking

## Quick Start

### Prerequisites

- Docker
- Docker Compose

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/QluxLab/Internet
   cd self-hosted-internet
   ```

2. **Start all services:**

   ```bash
   docker-compose up -d
   ```

3. **Access the dashboard:**
   Open your browser and go to `http://home.localhost` or `http://localhost`

### Service URLs

| Service | URL | Description |
|---------|-----|-------------|
| Homepage | `http://home.localhost` | Main dashboard |
| Wikipedia | `http://wiki.localhost` | Encyclopedia and docs |
| Movies | `http://media.localhost` | Media streaming |
| Git | `http://git.localhost` | Git server |
| Files | `http://files.localhost` | File management |
| Passwords | `http://vault.localhost` | Password manager |
| PDF Tools | `http://pdf.localhost` | PDF manipulation |
| Notes | `http://notes.localhost` | Wiki platform |
| DNS Admin | `http://dns.localhost` | DNS and ad-blocking |
| LM Studio | `http://localhost:1234` | AI models |
| Open WebUI | `http://localhost:8084` | AI chat interface |

## Project Structure

```
self-hosted-internet/
├── docker-compose.yml          # Main orchestration file
├── nginx/
│   └── nginx.conf              # Reverse proxy configuration
├── data/                       # Service configuration data
├── wikipedia/                  # 115GB of offline content
├── media/                      # Media content directory
└── README.md                   # This file
```

## Configuration

### Environment Variables

This project uses environment variables for configuration. A template is provided in `.env.example`:

1. **Copy the template:**
   ```bash
   cp .env.example .env
   ```

2. **Customize paths and settings:**
   Edit `.env` to match your system's directory structure and preferences.

3. **Key variables you may want to modify:**
   - `VIDEO_DATA_PATH` - Path to your media files (default: `./media`)
   - `FILEBROWSER_FILES` - Path to your internet data (default: `.`)
   - `*_DATA_PATH` - Various service data directories
   - Database passwords for security

### Adding Content

#### Media Content

To add media files for Jellyfin, place them in the `/d/video` directory on your system, or modify the path in `docker-compose.yml`:

```yaml
volumes:
  - /your/media/path:/media:ro
```

#### Documentation

The Wikipedia content is already included (115GB). To add more ZIM files:

1. Download ZIM files from [Kiwix](https://download.kiwix.org/)
2. Place them in the `wikipedia/` directory
3. Restart the Kiwix service: `docker-compose restart kiwix`

### Customizing Services

Each service can be configured by modifying its section in `docker-compose.yml` or by adding environment variables and volume mounts.

## 🛠️ Services Architecture

The project uses Docker containers orchestrated with Docker Compose:

- **Reverse Proxy**: Nginx routes traffic based on subdomains
- **Network Isolation**: All services run in a dedicated Docker network
- **Data Persistence**: Service data stored in local `data/` directory
- **Load Balancing**: Nginx handles routing and SSL termination

## Included Content

This project includes **115GB** of offline documentation in ZIM format covering:

- Programming languages (Python, JavaScript, Go, Rust, C++, Java, etc.)
- Web frameworks (React, Angular, Vue, Django, Flask, Laravel, etc.)
- Development tools (Docker, Kubernetes, Git, npm, etc.)
- Databases (MySQL, PostgreSQL, MongoDB, Redis, etc.)
- Cloud platforms and infrastructure tools

## Security

- **Network Isolation**: Services run in isolated Docker network
- **Password Management**: Vaultwarden with WebSockets support
- **DNS Filtering**: AdGuard Home blocks ads and trackers
- **Local AI**: No external API calls for AI services

## Important Notes

- **Storage Requirements**: The Wikipedia content requires 115GB of disk space
- **Media Path**: Jellyfin serves content from `/d/video` - ensure this path exists or modify it
- **DNS Configuration**: Set your system DNS to `127.0.0.1` to use AdGuard Home
- **Localhost Access**: All services are accessible via localhost subdomains

## Maintenance

### Updating Services

```bash
# Pull latest images
docker-compose pull

# Restart services
docker-compose up -d
```

### Backing Up Data

```bash
# Backup all service data
tar -czf backup-$(date +%Y%m%d).tar.gz data/
```

### Monitoring Services

```bash
# Check service status
docker-compose ps

# View logs
docker-compose logs --tail=100 [service-name]
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Kiwix](https://kiwix.org/) - Offline content serving
- [Jellyfin](https://jellyfin.org/) - Media streaming
- [Gitea](https://gitea.io/) - Git hosting
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden) - Password management
- [AdGuard Home](https://adguard.com/en/adguard-home/overview.html) - DNS filtering
- [Stirling PDF](https://stirling.tools/) - PDF tools
- [Homepage](https://gethomepage.dev/) - Dashboard interface

---

**Note**: This project is designed for educational and personal use. Ensure you comply with local laws and regulations regarding content distribution and usage.
