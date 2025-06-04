# 🧱 Inception - Containerized Infrastructure with Docker

![C](https://img.shields.io/badge/Language-C-blue) ![Makefile](https://img.shields.io/badge/Build-Makefile-yellow) ![Docker](https://img.shields.io/badge/Tool-Docker-informational) ![Docker Compose](https://img.shields.io/badge/Orchestration-Docker--Compose-lightblue)

The **Inception** project aims to introduce students to the fundamentals of **system administration** and **containerization** by building a fully functional infrastructure using Docker. Each service runs in its own container, promoting isolation, scalability, and security.

---

## 📋 Project Goal

Build a containerized web server infrastructure that includes:
- **NGINX** with SSL certificates for secure access.  
- **WordPress** connected to a **MariaDB** database.  
- **FTP server** for media file uploads.  
- **Redis**, **Adminer**, and other optional services as bonus.  
- **Docker Compose** to manage multi-container deployment.  
- Proper **networking and volume setup** between containers.  

This project provides hands-on experience with modern DevOps tools and practices.

---

## 📚 Core Concepts

- **Docker**: creating isolated environments for each service.  
- **Docker Compose**: orchestration of multi-container applications.  
- **System Security**: setting file permissions and securing access.  
- **SSL/TLS Configuration**: adding HTTPS support using self-signed certificates.  
- **Networking**: enabling communication between containers.  
- **Volumes**: persisting data between restarts.  

---

## ✨ Implemented Features

### 🖥️ Services Deployed
- **NGINX**: web server with HTTPS enabled using SSL.
- **MariaDB**: relational database server.
- **WordPress**: content management system served by NGINX.
- **FTP**: optional file transfer access with user authentication.

### 🧩 Infrastructure Features
- Containers run as non-root users.  
- Static IPs within Docker networks.  
- Volumes for database and WordPress persistence.  
- Secure permissions and limited access policies.  

---

## 🛠️ Tools & Standards

| Tool / Standard          | Description                                                  |
|--------------------------|--------------------------------------------------------------|
| **Docker**               | Containerization technology for services.                    |
| **Docker Compose**       | Multi-container orchestration.                               |
| **Makefile**             | Automates image building and container setup.                |
| **42 Norm**              | Ensures code and config quality and structure.               |

