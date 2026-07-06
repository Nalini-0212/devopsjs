# Production Deployment of React Application


## Project Overview

This project demonstrates the deployment of a React application in a production-ready environment using modern DevOps practices. The implementation covers containerization, CI/CD automation, cloud deployment, monitoring, alerting, and release management.

The application has been containerized using Docker, automated through Jenkins pipelines, deployed on AWS EC2, and monitored using Prometheus, Blackbox Exporter, and Alertmanager.

---

## Project Objectives

The primary objectives of this project are:

* Deploy a React application on AWS EC2.
* Containerize the application using Docker.
* Automate image build and deployment processes.
* Implement CI/CD using Jenkins.
* Maintain separate Development and Production environments.
* Store container images in Docker Hub repositories.
* Monitor application availability using Prometheus and Blackbox Exporter.
* Generate alerts through Alertmanager when application downtime is detected.
* Follow Infrastructure and DevOps best practices for deployment and operations.

---

## Technology Stack


| Category | Technology |
|----------|------------|
| Frontend | ReactJS |
| Web Server | Nginx |
| Containerization | Docker, Docker Compose |
| CI/CD | Jenkins |
| Version Control | Git, GitHub |
| Container Registry | Docker Hub |
| Cloud Platform | AWS EC2 (t3.micro used as t2.micro was not in free tier) | 
| Monitoring | Prometheus, Blackbox Exporter, Alertmanager |
| Scripting | Bash |

---

## Key Features

* Dockerized React application deployment.
* Application exposed on HTTP Port 80.
* Separate Development and Production workflows.
* Automated Docker image build and publishing.
* Jenkins integration with GitHub Webhooks
* Public Docker Hub repository for Development images.
* Private Docker Hub repository for Production images.
* Automated Production deployment to AWS EC2.
* Continuous application monitoring.
* Automated health checks using Blackbox Exporter.
* Alert notifications through Alertmanager.
* Infrastructure secured through AWS Security Groups.

---

## Solution Architecture


```text
                        GitHub Repository
                               │
                ┌──────────────┴──────────────┐
                │                             │
                ▼                             ▼
           Dev Branch                   Main Branch
                │                             │
                ▼                             ▼
             Jenkins CI/CD Pipeline (EC2-1)
                               │
                               ▼
                     Docker Image Build
                               │
                ┌──────────────┴──────────────┐
                ▼                             ▼
      Docker Hub DEV Repo         Docker Hub PROD Repo
                │                             │
                ▼                             ▼
        Manual Deployment       Automatic Deployment
                                              │
                                              ▼
                       React Application (EC2-1)
                                              │
                                              ▼
                                            Port 80
                                              │
                                              ▼
                        Blackbox Exporter (EC2-2)
                                              │
                                              ▼
                           Prometheus (EC2-2)
                                              │
                                              ▼
                           Alertmanager (EC2-2)
```

### Architecture Overview
The solution follows a complete DevOps lifecycle from code commit to production deployment.

* Developer pushes code to GitHub.
* GitHub Webhook triggers Jenkins.
* Jenkins builds Docker images.
* Docker images are pushed to Docker Hub.
* Production images are pulled and deployed to AWS EC2.
* Prometheus continuously monitors application health.
* Blackbox Exporter performs HTTP endpoint validation.
* Alertmanager sends notifications when downtime is detected.

---

## Source Repository

### Original Repository

```text
https://github.com/sriram-R-krishnan/devops-build
```

### Implementation Repository

```text
https://github.com/Nalini-0212/devopsjs
```

---

## Requirement Completion Status

| Requirement | Status |
|-------------|---------|
| React Application Deployment | ✅ |
| Dockerfile Creation | ✅ |
| Docker Compose Configuration | ✅ |
| build.sh Script | ✅ |
| deploy.sh Script | ✅ |
| GitHub Repository Setup | ✅ |
| Dev Branch Workflow | ✅ |
| Production Branch Workflow | ✅ |
| Docker Hub DEV Repository | ✅ |
| Docker Hub PROD Repository | ✅ |
| Jenkins CI/CD Pipeline | ✅ |
| GitHub Webhooks | ✅ |
| AWS EC2 Deployment | ✅ |
| Monitoring Setup | ✅ |
| Blackbox Exporter Health Checks | ✅ |
| Alertmanager Notifications | ✅ |
| Required Screenshots Uploaded | ✅ |

---

## Branching Strategy
The project follows a two-branch strategy to maintain separate Development and Production environments.

### Development Branch (dev)
The dev branch is used for feature development, testing, and validation before promoting changes to Production.

### Workflow

```text
Code Push
    ↓
Jenkins Build Trigger
    ↓
Docker Image Build
    ↓
Push Image to Docker Hub DEV Repository
    ↓
Manual Deployment
```
### Purpose

* Feature development and testing
* Build verification
* Image publishing to Development repository
* Manual deployment for validation

### Docker Repository

```text
naliniselv/react-app-dev
```
### Visibility

```text
Public
```
### Production Branch (main)


Note: The original project requirement specifies a `master` branch. This implementation uses GitHub's modern default branch naming convention (`main`) while maintaining the same production workflow.

The main branch represents the Production environment and contains stable, release-ready code.

### Workflow

```text
Merge dev → main
        ↓
Jenkins Build Trigger
        ↓
Docker Image Build
        ↓
Push Image to Docker Hub PROD Repository
        ↓
Automatic Deployment to AWS EC2
```

### Purpose

* Production release management
* Automated deployment pipeline
* Stable application delivery

### Docker Repository

```text
naliniselv/react-app-prod
```

### Visibility

```text
Private
```
### Release Process

```text
Developer Push
       ↓
    Dev Branch
       ↓
 Jenkins Build
       ↓
 Docker Hub DEV
       ↓
 Manual Validation
       ↓
 Merge dev → main
       ↓
 Jenkins Build
       ↓
 Docker Hub PROD
       ↓
 Automatic EC2 Deployment
 ```

---

## Git Version Control

Git was used as the version control system for source code management and branch-based development.
All Git operations were performed using the Git Command Line Interface (CLI) in accordance with the project requirements.

### Branch Strategy

```text
dev   → Development Environment
main  → Production Environment
```
### Git Ignore Configuration

The repository includes:

```text
.gitignore
.dockerignore
```

These files ensure unnecessary files, logs, local configurations, and build artifacts are excluded from source control and Docker build contexts.

### Git CLI Workflow
### Clone Repository

```text
git clone https://github.com/Nalini-0212/devopsjs.git
```
### Create Development Branch

```text
git checkout -b dev
```
### Stage Changes

```text
git add .
```

### Commit Changes

```text
git commit -m "Implemented React application deployment changes""
```


### Push to Development Branch

```text
git push origin dev
```

### Merge Development into Production

```text
Create Pull Request (dev → main)
```

### Version Control Workflow

```text
Developer Changes
        ↓
Git CLI Commands
        ↓
Push to dev Branch
        ↓
Jenkins CI Build
        ↓
Validation & Testing
        ↓
Merge dev → main
        ↓
Production Deployment
```

### Push Production Branch

```text
git push origin main
```

### Compliance Note

All source code changes were committed and pushed using Git CLI commands only, as required by the project instructions.

---

 ## CI/CD Workflow 

### Workflow Summary

```text
 Developer Push
       ↓
     GitHub
       ↓
 GitHub Webhook
       ↓
     Jenkins
       ↓
 Docker Image Build
       ↓
 Docker Hub Registry
       ↓
 AWS EC2 Deployment
       ↓
 Prometheus Monitoring
       ↓
 Alertmanager Notifications
 ```

---

## Docker Implementation

The application is containerized using Docker and deployed using Docker Compose. Docker ensures a consistent and portable runtime environment across Development and Production environments.

### Dockerfile
A custom Dockerfile is used to package the React application and serve the production build using Nginx.
### Features

* Lightweight Nginx Alpine base image
* Serves the React production build
* Optimized for production deployment
* Exposes application on Port 80
* Minimal container footprint

### Dockerfile

```bash
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY /app/build/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

### Build Docker Image

```bash
docker build -t react-app -f docker/Dockerfile .
```

### Docker Compose
Docker Compose is used to simplify container deployment and management.

### docker-compose.yml

```bash
version: "3.8"

services:
  react-app:
    image: ${IMAGE_NAME}
    container_name: react-app-container
    ports:
      - "80:80"
    restart: unless-stopped
```

### Features

* Deploys the application container on Port 80
* Supports dynamic image selection through environment variables
* Automatically restarts containers on failure or system reboot
* Simplifies deployment and container lifecycle management

### Start Application

```bash
IMAGE_NAME=naliniselv/react-app-dev:latest \
docker compose -f docker/docker-compose.yml up -d
```
### Stop Application

```bash
docker compose -f docker/docker-compose.yml down
```

### Verify Running Containers

```bash
docker ps
```
---

## Docker Image Management
Two separate repositories are maintained in Docker Hub to support Development and Production workflows.
### Development Repository

```text
naliniselv/react-app-dev
```
* Public repository
* Used for development and testing
* Images are automatically built and pushed from the dev branch

### Production Repository

```text
naliniselv/react-app-prod
```
* Private repository
* Used for production releases
* Images are automatically built, pushed, and deployed from the main branch

## Container Deployment Flow

```text
Dockerfile
     ↓
Docker Build
     ↓
Docker Image
     ↓
Docker Hub Repository
     ↓
Docker Compose
     ↓
Running Container
     ↓
React Application
     ↓
Port 80
```

---

## Automation Scripts

To simplify and standardize the build and deployment process, Bash scripts are used for Docker image creation and application deployment. These scripts are integrated with the Jenkins CI/CD pipeline and can also be executed manually when required.

## build.sh
The build.sh script is responsible for building the Docker image using the application's Dockerfile.
Responsibilities

* Build Docker images using the configured Dockerfile.
* Support Jenkins CI pipeline execution.
* Generate deployable application images.
* Ensure consistency across environments.

### Script Workflow

```text
Read IMAGE_NAME
        ↓
Build Docker Image
        ↓
Tag Image
        ↓
Ready for Push
```

### Usage

```bash
IMAGE_NAME=naliniselv/react-app-dev:latest ./scripts/build.sh
```

### Script

```bash
#!/bin/bash
set -e

echo "Building Docker image: $IMAGE_NAME"

docker build -t $IMAGE_NAME -f docker/Dockerfile .
```

## deploy.sh

The deploy.sh script is responsible for deploying the latest application image using Docker Compose.
Responsibilities

* Pull the latest Docker image.
* Stop existing containers.
* Deploy the latest application version.
* Ensure service availability after deployment

### Script Workflow

```text
Pull Latest Image
        ↓
Stop Existing Container
        ↓
Start Updated Container
        ↓
Application Available on Port 80
```

### Usage

```bash
IMAGE_NAME=naliniselv/react-app-prod:latest ./scripts/deploy.sh
```
### Script

```bash
#!/bin/bash
set -e

echo "Pulling latest image..."
docker pull $IMAGE_NAME

echo "Stopping existing container..."
docker compose -f docker/docker-compose.yml down || true

echo "Starting application..."
IMAGE_NAME=$IMAGE_NAME docker compose -f docker/docker-compose.yml up -d
```

## Integration with Jenkins
Both scripts are executed automatically through the Jenkins pipeline.

### Development Workflow

```text
Push to Dev Branch
       ↓
Jenkins Trigger
       ↓
Execute build.sh
       ↓
Push Image to Docker Hub DEV Repository
```
### Production Workflow

```text
Merge Dev → Main
         ↓
Jenkins Trigger
         ↓
Execute build.sh
         ↓
Push Image to Docker Hub PROD Repository
         ↓
Execute deploy.sh
         ↓
Deploy Latest Version to AWS EC2
```
### Benefits

* Simplifies build and deployment operations.
* Reduces manual intervention.
* Ensures consistent deployment across environments.
* Easily reusable in CI/CD pipelines.
* Improves deployment reliability and repeatability.

---

## Jenkins Configuration

Jenkins is used as the Continuous Integration and Continuous Deployment (CI/CD) tool for automating application build, image publishing, and deployment activities.

### Jenkins Setup

### Jenkins Server

Jenkins is installed and configured on the AWS EC2 instance used for application deployment.

### Installed Components

* Jenkins
* Docker Engine
* Docker Compose
* Git
* GitHub Webhook Integration

### Credentials Configuration

The following credentials are configured in Jenkins.

#### Docker Hub Credentials

| Credential Type | Purpose |
|----------------|---------|
| Username & Password | Docker Hub Authentication |

#### Credential ID

```text
dockerhubcred
```

These credentials are used by the pipeline to authenticate and push Docker images to Docker Hub repositories.

### GitHub Integration
GitHub Webhooks are configured to trigger Jenkins builds automatically when code changes are pushed to the configured branches.
## Triggered Branches

```text
dev
main
```

## Pipeline Configuration

### Jenkins Pipeline Stages

| Stage        | Description                                |
| ------------ | ------------------------------------------ |
| Checkout     | Retrieve source code from GitHub           |
| Docker Login | Authenticate with Docker Hub               |
| Build        | Build Docker image                         |
| Push         | Push image to Docker Hub                   |
| Deploy       | Deploy image to AWS EC2 (main branch only) |
| Verify       | Validate running application               |

### Development Pipeline

```text
Push to Dev Branch
       ↓
Jenkins Trigger
       ↓
Execute build.sh
       ↓
Docker Build
       ↓
Push Image to Docker Hub DEV
```
### Production Pipeline

```text
Merge Dev → Main
         ↓
Jenkins Trigger
         ↓
Execute build.sh
         ↓
Push Image to Docker Hub PROD
         ↓
Execute deploy.sh
         ↓
Deploy Latest Version on AWS EC2
```
---

## AWS Deployment
The production application is hosted on AWS EC2.

### EC2 Instance

```text
Instance Type: t3.micro
Operating System: Ubuntu Linux
```

## Deployment Environment

The solution is deployed across two AWS EC2 instances to separate application delivery from monitoring and observability services.

### EC2-1: Application & CI/CD Server

This instance hosts the application deployment and CI/CD components.

**Components Installed:**

* Jenkins Server
* Docker Engine
* Docker Compose
* React Application Container
* Nginx Web Server

**Responsibilities:**

* Source code integration
* Docker image build and push
* Application deployment
* Production release automation

---

### EC2-2: Monitoring Server

This instance hosts the monitoring and alerting stack.

**Components Installed:**

* Prometheus
* Blackbox Exporter
* Alertmanager

**Responsibilities:**

* Application health monitoring
* HTTP endpoint validation
* Availability checks
* Alert generation and notification management


**Note**

* AWS t3.micro instances were used for both EC2 servers, as they were available under the AWS Free Tier during implementation.
* Jenkins and the application deployment were hosted on the same EC2 instance (EC2-1). This design aligns with the project requirement that SSH access should be restricted to a single trusted public IP address, while also simplifying CI/CD management and reducing infrastructure overhead.
* The monitoring stack was deployed on a separate EC2 instance (EC2-2) to provide isolation between application workloads and monitoring services.

---

### Infrastructure Overview

```text
                 GitHub
                    │
                    ▼
                 Jenkins
              (EC2-1)
                    │
                    ▼
            Docker Hub
                    │
                    ▼
        React Application
              (EC2-1)
                    │
                    ▼
               HTTP :80
                    │
                    ▼
          Blackbox Exporter
              (EC2-2)
                    │
                    ▼
              Prometheus
              (EC2-2)
                    │
                    ▼
             Alertmanager
              (EC2-2)
                    │
                    ▼
             Notifications
```

## Security Group Configuration

| Port | Access       |
| ---- | ------------ |
| 22   | My Public IP |
| 80   | 0.0.0.0/0    |
| 8080 | My Public IP |

## Application Access

```text
http://35.154.32.62:80
```

## Deployment Verification

### Check Running Containers

```bash
docker ps
```

### Check Docker Images

```bash
docker images
```

### Verify Application

```bash
curl http://localhost:80
```
### View Container Logs

```bash
docker logs react-app-container
```
 
---

## Monitoring Architecture

The monitoring stack ensures application availability and early outage detection.

### Monitoring Flow

```text
React Application
        │
HTTP Probe
        ▼
Blackbox Exporter
        │
Metrics
        ▼
Prometheus
        │
Alert Rules
        ▼
Alertmanager
        │
Notifications
        ▼
Email Alerts
```
### Prometheus
### Responsibilities:

* Collect metrics
* Execute health checks
* Evaluate alert rules
* Monitor target availability

### Blackbox Exporter
### Responsibilities:

* Perform HTTP probes
* Validate application responses
* Detect endpoint failures


### Alertmanager
### Responsibilities:

* Process Prometheus alerts
* Group alert events
* Send downtime notifications

## Automated Alerting

Prometheus continuously monitors the application endpoint through Blackbox Exporter.

When the application becomes unavailable:

* Blackbox Exporter detects the failure.
* Prometheus evaluates the alert rule.
* Alertmanager receives the alert.
* Notification is triggered indicating application downtime.

This ensures proactive monitoring and rapid issue detection.


### Monitored Endpoint

```text
http://35.154.32.62:80
```
This clearly shows what Blackbox Exporter is monitoring.

### Monitoring Server

```text
http://13.233.207.115:9090
```

Used to access the Prometheus monitoring dashboard and monitor application health status.

---

## Project Structure

```text
devopsjs/
│
├── app/
│   └── build/
│
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── jenkins/
│   └── Jenkinsfile
│
├── scripts/
│   ├── build.sh
│   └── deploy.sh
│
├── docs/
│   └── ApplicationDeployment.docx
│       (Detailed implementation guide,
│        deployment steps, configurations,
│        and supporting screenshots)
│
├── screenshots/
│   ├── jenkins/
│   │   ├── login-page.png
│   │   ├── job-configuration.png
│   │   ├── pipeline-configuration.png
│   │   └── build-console-output.png
│   │
│   ├── aws/
│   │   ├── ec2-console.png
│   │   └── security-group.png
│   │
│   ├── dockerhub/
│   │   ├── dev-repository.png
│   │   └── prod-repository.png
│   │
│   ├── deployment/
│   │   └── application-homepage.png
│   │
│   └── monitoring/
│       ├── prometheus-targets.png
│       ├── blackbox-exporter.png
│       ├── alertmanager-dashboard.png
│       └── healthcheck-status.png
│
├── .dockerignore
├── .gitignore
├── README.md
└── LICENSE
```

---

## Documentation

Detailed implementation documentation is available in:

```text
docs/ApplicationDeployment.docx
```
The document contains:

* Environment setup
* Jenkins installation
* Docker configuration
* Docker Hub integration
* GitHub webhook configuration
* AWS deployment steps
* Monitoring setup
* Troubleshooting guide
* Supporting screenshots

The document provides detailed step-by-step implementation procedures, configuration details, validation results, troubleshooting references, and supporting screenshots.

---

## Screenshots

### Jenkins

* Login Page
* Job Configuration
* Pipeline Configuration
* Build Console Output

### AWS

* EC2 Console
* Security Group Configuration

### Docker Hub

* Development Repository with Tags
* Production Repository with Tags

### Application

* Deployed React Application

### Monitoring

* Prometheus Targets
* Blackbox Exporter Health Check
* Alertmanager Dashboard
* Monitoring Status

**Note**
All screenshots required for the assignment submission are available under the `screenshots/` directory.

---

## Future Enhancements

* Kubernetes deployment
* HTTPS using SSL/TLS
* Grafana dashboards
* Automated Docker image scanning
* Infrastructure as Code using Terraform

---

## Submission Details

### GitHub Repository


```text
https://github.com/Nalini-0212/devopsjs
```
### Docker Hub Images

### Development (Public)

```text
naliniselv/react-app-dev
```

### Production (Private)

```text
naliniselv/react-app-prod
```

### Deployed Application

```text
http://35.154.32.62:80
```

---

## Assignment Compliance

✅ Application deployed on AWS EC2

✅ Application accessible on Port 80

✅ Dockerfile created

✅ Docker Compose implemented

✅ build.sh script implemented

✅ deploy.sh script implemented

✅ GitHub repository maintained using Git CLI

✅ Development and Production branch strategy implemented

✅ Jenkins CI/CD pipeline configured

✅ GitHub Webhook integration configured

✅ Docker Hub DEV repository (Public)

✅ Docker Hub PROD repository (Private)

✅ AWS Security Group configured

✅ Prometheus monitoring configured

✅ Blackbox Exporter health checks configured

✅ Alertmanager notifications configured

✅ All required screenshots uploaded

✅ Repository URL, deployed URL, and Docker image names included

---


## Assignment Screenshot Evidence

| Requirement | Screenshot Location |
|------------|---------------------|
| Jenkins Login Page | screenshots/jenkins/login-page.png |
| Jenkins Configuration | screenshots/jenkins/job-configuration.png |
| Jenkins Execute Commands | screenshots/jenkins/build-console-output.png |
| AWS EC2 Console | screenshots/aws/ec2-console.png |
| AWS Security Group | screenshots/aws/security-group.png |
| Docker Hub Repositories | screenshots/dockerhub/ |
| Deployed Application | screenshots/deployment/application-homepage.png |
| Monitoring Health Check | screenshots/monitoring/healthcheck-status.png |

---

## Author

**Nalini Selvaraj**

---

## License

This project is licensed under the MIT License.
