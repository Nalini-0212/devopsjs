# ReactJS E-Commerce Application

A production-ready **ReactJS E-Commerce Application** demonstrating modern DevOps practices including Docker containerization, Jenkins CI/CD, Docker Hub image management, AWS EC2 deployment, and application monitoring with Prometheus.

---

# Project Objectives

* Containerize the React application using Docker.
* Automate image build and deployment using Jenkins.
* Store Docker images in Docker Hub.
* Deploy the production application to AWS EC2.
* Monitor application availability using Prometheus, Blackbox Exporter, and Alertmanager.

---

# Technology Stack

| Category           | Technology                                  |
| ------------------ | ------------------------------------------- |
| Frontend           | ReactJS                                     |
| Containerization   | Docker, Docker Compose                      |
| CI/CD              | Jenkins                                     |
| Version Control    | Git & GitHub                                |
| Container Registry | Docker Hub                                  |
| Cloud Platform     | AWS EC2                                     |
| Monitoring         | Prometheus, Blackbox Exporter, Alertmanager |
| Scripting          | Bash                                        |

---

# Project Structure

```text
reactjs-ecommerce/
│
├── app/
│   └── dist/                    # React production build
│
├── docker/
│   ├── Dockerfile               # Docker image definition
│   └── docker-compose.yml        # Container orchestration
│
├── scripts/
│   ├── build.sh                 # Builds Docker image
│   └── deploy.sh                # Deploys latest image
│
├── jenkins/
│   └── Jenkinsfile              # CI/CD pipeline
│
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus.yml
│   │   └── alert.rules.yml
│   │
│   ├── alertmanager/
│   │   └── alertmanager.yml
│   │
│   └── grafana/
│
├── docs/
│   └── screenshots/
│
├── LICENSE
├── README.md
├── .gitignore
└── .dockerignore
```

---

# CI/CD Workflow

## Development (`dev` Branch)

1. Developer pushes code to the `dev` branch.
2. GitHub webhook triggers Jenkins.
3. Jenkins checks out the source code.
4. `scripts/build.sh` builds the Docker image.
5. Jenkins pushes the image to the **Docker Hub dev** repository.

> No deployment is performed from the `dev` branch.

---

## Production (`master` Branch)

1. Changes are merged from `dev` into `master`.
2. Jenkins builds the production image.
3. Jenkins pushes the image to the **Docker Hub prod** repository.
4. Jenkins connects to the AWS EC2 instance.
5. `scripts/deploy.sh` pulls the latest production image.
6. Docker Compose recreates the application container.

---

# Docker

## Build the Image

```bash
chmod +x scripts/build.sh
./scripts/build.sh reactjs-ecommerce
```

## Start the Application

```bash
docker compose -f docker/docker-compose.yml up -d
```

## Verify Containers

```bash
docker ps
docker images
```

---

# Docker Hub

Two Docker Hub repositories are maintained.

| Repository | Visibility | Purpose             |
| ---------- | ---------- | ------------------- |
| dev        | Public     | Development builds  |
| prod       | Private    | Production releases |

---

# AWS Deployment

The production application is hosted on an AWS EC2 instance.

## Security Group

| Port | Access               |
| ---- | -------------------- |
| 22   | My Public IP         |
| 80   | Anywhere (0.0.0.0/0) |

Deployment is automated through Jenkins using the `deploy.sh` script.

---

# Monitoring

The application is monitored using:

* Prometheus
* Blackbox Exporter
* Alertmanager

Prometheus periodically checks the application's HTTP endpoint through Blackbox Exporter. If the application becomes unavailable, Alertmanager generates an alert notification.

---

# Repository Information

## GitHub Repository

```
https://github.com/<your-github-username>/<repository-name>
```

## Docker Hub Images

Development

```
<dockerhub-username>/dev:latest
```

Production

```
<dockerhub-username>/prod:latest
```

## Application URL

```
http://<EC2-PUBLIC-IP>
```

---

# Screenshots

The `docs/screenshots` directory contains screenshots of:

* GitHub Repository
* Jenkins Dashboard
* Jenkins Pipeline Configuration
* Jenkins Build Logs
* Docker Hub Repositories
* AWS EC2 Instance
* Security Group Configuration
* Running Application
* Prometheus Targets
* Alertmanager Status
* Grafana Dashboard (if configured)

---

# Future Enhancements

* Kubernetes deployment
* HTTPS using SSL/TLS
* Grafana dashboards
* Automated Docker image scanning
* Infrastructure as Code using Terraform

---

# Author

**Nalini S**

---

# License

This project is licensed under the MIT License.
