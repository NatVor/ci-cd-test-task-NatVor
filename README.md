# Docker-Jenkins-Prometheus-Grafana (Test Task)

Solution for deploying a Python application in a Docker container, configuring ci/cd with Jenkins, and monitoring with Prometheus, Grafana, cAdvisor, NodeExporter

## Objective
Create a simple infrastructure that includes:
1. CI/CD pipeline for a containerized application.
2. System monitoring.
3. Documentation for the work performed.

## Install

### Clone this repository on your Docker host, cd into test directory and run compose up:

```
git clone git@github.com:NatVor/ci-cd-test-task-NatVor.git
cd ci-cd-test-task-NatVor
docker-compose up -d
```

## Prerequisites:

* Java >= 17
* Docker
* Docker Compose 
* Jenkins `http://<host-ip>:8080`
* Prometheus (metrics database) `http://<host-ip>:9090`
* Grafana (visualize metrics) `http://<host-ip>:3000`
* Node Exporter (host metrics collector)
(You can install most of them by running the install.sh script)

## Containers:

* cAdvisor (containers metrics collector)
* AlertManager (alerts management) `http://<host-ip>:9093`
(Execute the script install-monitiring.sh)
 
Useful commands in case of error:
Add a Jenkins user to the docker group:
sudo usermod -aG docker $USER (This command allows the current user to execute Docker commands without having to specify sudo).
sudo usermod -aG docker jenkins (This command gives the Jenkins user access to Docker, allowing Jenkins to work with Docker containers when performing pipelining or other tasks).
sudo chmod 666 /var/run/docker.sock 

For this Jenkins pipeline to work properly, you need to install several plugins to support Docker and Git. Here is the list of plugins you need to install:

1. Git Plugin
2. Docker Pipeline Plugin
3. Docker Plugin
4. Pipeline: Declarative
5. Pipeline: Groovy
