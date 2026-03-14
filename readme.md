# Enterprise CI/CD Pipeline & Kubernetes Deployment on AWS

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Python](https://img.shields.io/badge/python-3.9-blue)
![Kubernetes](https://img.shields.io/badge/kubernetes-v1.26-blue)
![Terraform](https://img.shields.io/badge/terraform-v1.4-purple)
![AWS](https://img.shields.io/badge/AWS-Cloud_Infrastructure-orange)

A production-oriented DevOps pipeline that automates the build, test, containerization, and deployment of a Python Flask application onto a Kubernetes cluster hosted on AWS.  
This project demonstrates **Infrastructure as Code (IaC), container orchestration, CI/CD automation, and system observability**.

---

# 🏗 Architecture Overview

This system implements a **complete DevOps lifecycle** from code commit to monitored deployment.

### Pipeline Workflow

Developer Push (GitHub) 
↓ 
Jenkins Pipeline Trigger 
↓ 
Code Quality Checks (Lint + Tests) 
↓ 
Docker Image Build 
↓ 
Push to Container Registry 
↓ 
Terraform Provision AWS Infrastructure 
↓ 
Ansible Configure Kubernetes Nodes 
↓ 
Kubernetes Deployment (Rolling Update) 
↓ 
Prometheus Metrics Collection 
↓ 
Grafana Monitoring Dashboard

This workflow ensures **fully automated deployments with minimal manual intervention**.

---

# ☁ Infrastructure as Code Strategy

The infrastructure follows a **code-first immutable infrastructure approach**.

### Terraform
Terraform is used to provision AWS infrastructure:

- EC2 instances
- Security groups
- Networking configuration

### Ansible

Ansible automates server configuration:

- Docker installation
- Kubernetes cluster setup
- node configuration

This ensures **consistent infrastructure provisioning across environments**.

---

# ⚙ Tech Stack

| Domain | Technology | Implementation |
|------|-------------|----------------|
| Cloud Provider | AWS | EC2, Security Groups |
| Infrastructure as Code | Terraform | Cloud resource provisioning |
| Configuration Management | Ansible | Server configuration |
| Containerization | Docker | Flask app container |
| Orchestration | Kubernetes | Cluster deployment |
| CI/CD | Jenkins | Pipeline automation |
| Monitoring | Prometheus + Grafana | Metrics collection & visualization |
| Application | Python / Flask | REST API service |

---

# 🚀 Deployment Runbook

### 1. Provision Infrastructure

Navigate to the Terraform directory and provision infrastructure.

```bash
cd infra/terraform
terraform init
terraform plan
terraform apply -auto-approve


---

2. Configure Servers

Use Ansible to bootstrap the infrastructure.

cd ../ansible
ansible-playbook -i inventory.ini playbook.yml

This installs:

Docker

Kubernetes dependencies

cluster configuration tools



---

3. Initialize Kubernetes Cluster

Run on the master node:

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

Install the networking layer:

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml


---

☸ Kubernetes Deployment Strategy

To ensure high availability and zero downtime, the deployment uses:

Rolling Updates

Gradually replaces pods without stopping the application.

Health Probes

Liveness probe detects failing containers

Readiness probe ensures traffic is routed only to healthy pods


Load Distribution

Kubernetes services balance traffic across running pods.


---

📊 Observability & Monitoring

Prometheus continuously collects cluster metrics including:

CPU usage

memory utilization

network traffic

application request latency


Grafana dashboards visualize:

resource utilization

pod health

request throughput

error rates


This enables real-time system visibility and troubleshooting.


---

📂 Project Structure

ci-cd-kubernetes-pipeline/
│
├── app/                 # Flask application
│   └── app.py
│
├── infra/
│   └── terraform/       # Infrastructure provisioning
│
├── ansible/             # Server configuration
│
├── k8s/                 # Kubernetes manifests
│
├── monitoring/          # Prometheus + Grafana configs
│
├── Jenkinsfile          # CI/CD pipeline definition
│
└── docker/              # Docker configuration


---

📈 Key Learning Outcomes

This project demonstrates practical experience with:

Infrastructure as Code using Terraform

Configuration automation using Ansible

Container orchestration using Kubernetes

Automated CI/CD pipelines using Jenkins

Containerized application deployment with Docker

Observability and monitoring with Prometheus & Grafana



---

🔮 Future Improvements

Possible enhancements for this system:

Deploy using managed Kubernetes (EKS)

implement auto-scaling policies

integrate Helm charts for deployment

implement centralized logging (ELK stack)



---

👨‍💻 Author

Shreyas Neelaraddi
Cloud / DevOps Engineer

GitHub: https://github.com/ShreyasVN