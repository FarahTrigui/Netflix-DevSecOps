# 🎬 Netflix Clone - CI/CD Pipeline with AZURE KUBERNETES SERVICE, Jenkins, Prometheus & Grafana

![devsecops](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/68747470733a2f2f696d6775722e636f6d2f764f5275426e4b2e706e67.jpeg)

# Project Overview 
i can say that i "successfully :))" deployed a Netflix clone on kubernetes. i was using Jenkins as a CICD tool and deploying the application on a Docker container and Kubernetes Cluster, 
meanwhile monitor the Jenkins and Kubernetes metrics using Grafana, Prometheus and Node exporter.
![app](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/app.png)
# CI/CD Pipeline Overview
![Jenkins Pipeline](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/jenkins.png)
The Jenkins pipeline performs the following stages:
### 🧹 Clean Workspace
Clears the Jenkins workspace.
### 📥 Git Checkout
Pulls source code from GitHub.
### 🔍 SonarQube Scan
![sonarQube](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/sonarQube.png)
Performs static code analysis using SonarQube Scanner.
### ✅ Quality Gate
Verifies code quality through SonarQube’s quality gate.
### 📦 Install Dependencies
Installs npm packages.
### 🛡 Trivy File System Scan
Scans source files for vulnerabilities.
### 🐳 Docker Build & Push
Builds Docker image, tags it, and pushes to DockerHub.
### 🧪 Trivy Image Scan
Scans Docker image for vulnerabilities.
### 🧪 Optional Local Deployment
Runs the image locally using docker run (for quick testing).
### ☸️ Kubernetes Deployment
Applies deployment & service YAMLs to deploy on AKS via kubectl.
### 📧 Email Notification
![email](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/mail.png)
Sends email with build result, logs, and security scan attachments.
# ☸️ Kubernetes Deployment on AKS
![cluster AKS](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/cluster-running.jpg)
![cluster AKS](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/cluster-monitoring.jpg)
AKS cluster created via Azure CLI or Azure Portal.
kubeconfig exported using az aks get-credentials and uploaded to Jenkins as a Secret File.
Jenkins uses withKubeConfig to apply manifests inside the Kubernetes folder.
# Monitoring Setup
![prometheus Jenkins](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/prometheus.png)
![Grafana Jenkins](https://github.com/FarahTrigui/Netflix-DevSecOps/blob/main/grafana.png)
✅ Jenkins, Docker, and AKS are monitored using Prometheus and Grafana.
Node Exporter installed on Jenkins host
Prometheus scrapes metrics from:
Jenkins (via Prometheus plugin or port 8080)
Docker containers (via cAdvisor)
AKS Nodes (via kube-state-metrics & node-exporter DaemonSets)
Grafana Dashboards created for:
*Jenkins builds & performance
*AKS node & pod health
*Docker container resource usage
# 🛡 Security: Trivy Scans
Two types of scans are performed using Trivy:
### 🗂 File System Scan: Scans the local project files before image build.
### 🐳 Docker Image Scan: Scans the published image for vulnerabilities post-push.
Scan results are saved as:
*trivyfs.txt
*trivyimage.txt
And attached to email notifications.
