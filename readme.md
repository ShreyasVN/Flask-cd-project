```markdown
# Automated CI/CD Platform for Flask Application Deployment

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Python](https://img.shields.io/badge/python-3.9-blue)
![Kubernetes](https://img.shields.io/badge/kubernetes-v1.26-blue)
![Terraform](https://img.shields.io/badge/terraform-v1.4-purple)

This project implements a production-grade CI/CD pipeline to automate the build, test, containerization, infrastructure provisioning, and deployment of a Flask application on Kubernetes. It integrates monitoring using Prometheus and Grafana to ensure high availability and observability.

---

## 🏗️ Architecture Overview

The system follows a complete Cloud-Native DevOps lifecycle, moving from code development to automated deployment and monitoring.

### Workflow Description
1.  **Code & Build:** Developers push code to Git, triggering the Jenkins pipeline.
2.  **Containerization:** Docker builds the image and pushes it to the Container Registry.
3.  **Infrastructure:** Terraform provisions AWS resources; Ansible configures the nodes.
4.  **Orchestration:** Kubernetes deploys the application pods and services.
5.  **Observability:** Prometheus scrapes metrics, visualized by Grafana.

---

## ⚙️ Infrastructure as Code (IaC)

We use a "Code-First" approach to infrastructure. Terraform handles the provisioning of the cloud layer (Network, VMs), while Ansible handles the configuration management (Dependencies, Docker, K8s tools).

---

## 🛠 Tech Stack

| Category | Tools | Description |
|----------|-------|-------------|
| **Backend** | Flask (Python) | REST API with `/health` and `/metrics` endpoints. |
| **Containerization** | Docker | Container image creation and management. |
| **Orchestration** | Kubernetes | Cluster management for container deployment. |
| **CI/CD** | Jenkins | Automated pipeline for building, testing, and deploying. |
| **IaC** | Terraform | AWS EC2 provisioning. |
| **Config Mgmt** | Ansible | Configuration of servers and K8s dependencies. |
| **Monitoring** | Prometheus, Grafana | Metrics scraping and visualization. |

---

## 📁 Project Structure

```text
flask-cd-project/
├── app/                          # Flask Application Source
│   ├── app.py                    # Main application logic
│   ├── requirements.txt          # Python dependencies
│   └── test_app.py               # Unit tests
├── docker/                       # Container Configuration
│   └── Dockerfile                # Image build definition
├── k8s/                          # Kubernetes Manifests
│   ├── deployment.yaml           # Deployment config
│   └── service.yaml              # Service config
├── infra/                        # Infrastructure as Code
│   ├── terraform/                # AWS Provisioning
│   └── ansible/                  # Server Configuration
├── images/                       # Architecture Diagrams
├── Jenkinsfile                   # CI/CD Pipeline Definition
└── README.md                     # Project Documentation

```

---

## 🚀 Setup Instructions

### 1. Local App Testing

```bash
cd app
pip install -r requirements.txt
python app.py
# Verify at http://localhost:5000
pytest test_app.py

```

### 2. Infrastructure Provisioning

```bash
cd infra/terraform
terraform init
terraform apply -auto-approve

```

### 3. Configuration Management

```bash
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml

```

### 4. Kubernetes Initialization

Run the following on the **Master Node**:

```bash
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
kubectl apply -f [https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml](https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml)

```

---

## 🔄 Pipeline Stages

The CI/CD pipeline is designed to be fail-fast and automated:

1. **Code Commit:** Triggered by Git push.
2. **Build & Test:** Runs `pytest` and linting checks.
3. **Docker Build:** Creates the container image.
4. **Image Push:** Uploads artifact to Registry.
5. **Kubernetes Deploy:** Updates the cluster manifest.
6. **Monitoring:** Validates health metrics.

---

## ☸️ Kubernetes Deployment Strategy

The application utilizes a **Rolling Update** strategy to ensure zero downtime during deployments.

* **Ingress Controller:** Routes external traffic to the service.
* **Load Balancer:** Distributes traffic across active Pods.
* **Health Checks:** Liveness and Readiness probes ensure traffic only hits healthy pods.

---

## 📊 Monitoring & Observability

Real-time monitoring is achieved via Prometheus (metrics collection) and Grafana (visualization).

### Key Metrics Monitored:

* **System Resource Health:** CPU & Memory usage.
* **Traffic Load:** Application Request Rate (RPS).
* **Reliability:** 4xx/5xx HTTP error tracking.
* **Orchestration Health:** Pod Running vs Pending status.

---

## 👨‍💻 Author

**Shreyas N - DevOps Engineer**

```