# Magento 2 Docker Environment

This repository provides a ready-to-use **Docker-based local development environment** for **Magento 2.4.8-p3**.

The PHP runtime image is **pre-built and hosted on Docker Hub**, so team members do **not** need to install PHP, Composer, MySQL, or any dependencies locally.

---

## 📦 Tech Stack

- Magento 2.4.8-p3
- PHP 8.2 (custom Docker image)
- Nginx
- MySQL 8.0
- OpenSearch 2.5
- Redis
- RabbitMQ
- Docker Desktop (WSL2 on Windows)

---

## 🐳 Docker Image

Custom PHP image used by this project:


Includes:
- PHP 8.2 with all Magento-required extensions
- Composer 2
- Non-root `magento` user (UID 1000)
- Magento-friendly PHP configuration

---

## ✅ Prerequisites

- Docker Desktop installed  
- WSL2 enabled (Windows users)  
- Git installed  

---

## 🚀 Quick Start (Team Members)

### 1. Clone the repository
```bash
git clone https://github.com/thisis4badrish/magento-docker.git
cd magento-docker
```
### 2. Start Docker containers
```bash
docker compose up -d
```

 Docker will automatically pull all required images.

### 3. Access the PHP container
```bash
docker exec -it magento_app bash
```
You should see:
```bash
magento@<container>:/var/www/html$
```
## 🌐 Service URLs
Service	URL
Magento Frontend	http://localhost:8080

Magento Admin	http://localhost:8080/admin

RabbitMQ Management	http://localhost:15672

OpenSearch	http://localhost:9200

## 🔁 Common Docker Commands

## Start containers:
```bash
docker compose up -d
```

## Stop containers:
```bash
docker compose down
```

## Check running containers:
```bash
docker ps
```

## ⚠️ Important Notes

1. Do not run docker compose build

2. PHP image is already provided via Docker Hub

3. No local PHP, MySQL, or Composer installation required

4. Same setup works on Windows, macOS, and Linux

## 👨‍💻 Maintainer

1. Docker Image: badrishmishra/magento-php:8.2

2. Environment maintained by Badrish Mishra
