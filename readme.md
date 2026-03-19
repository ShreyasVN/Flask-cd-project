---

# Enterprise CI/CD Pipeline & Kubernetes Deployment on AWS

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Python](https://img.shields.io/badge/python-3.9-blue)
![Kubernetes](https://img.shields.io/badge/kubernetes-v1.26-blue)
![Terraform](https://img.shields.io/badge/terraform-v1.4-purple)
![AWS](https://img.shields.io/badge/AWS-Cloud_Infrastructure-orange)

A production-oriented DevOps pipeline that automates the build, test, containerization, and deployment of a Python Flask application onto a Kubernetes cluster hosted on AWS.

This project demonstrates **Infrastructure as Code (IaC), container orchestration, CI/CD automation, and system observability**, with support for managed database integration (AWS RDS).

---

## 🏗 Architecture & Workflow

This system implements a complete DevOps lifecycle from code commit to monitored deployment.

### 🔄 CI/CD Pipeline Flow

1. **Developer Push** → Code pushed to GitHub repository  
2. **Jenkins Trigger** → Pipeline automatically initiates  
3. **Continuous Integration** → Code quality checks, linting, and testing  
4. **Containerization** → Docker image built and pushed to registry  
5. **Infrastructure Provisioning (IaC)** → Terraform provisions AWS EC2 infrastructure  
6. **Configuration Management** → Ansible configures servers and Kubernetes nodes  
7. **Deployment** → Kubernetes performs rolling updates  
8. **Monitoring** → Prometheus & Grafana track system performance  

---

## ⚙️ Tech Stack & Implementation

| Domain | Technology | Implementation Detail |
|--------|------------|-----------------------|
| Cloud Provider | AWS | EC2, Security Groups, VPC |
| Infrastructure as Code | Terraform | Infrastructure provisioning |
| Configuration Management | Ansible | Server & Kubernetes setup |
| Containerization | Docker | Flask app container |
| Orchestration | Kubernetes | Cluster deployment |
| CI/CD | Jenkins | Pipeline automation |
| Monitoring | Prometheus + Grafana | Metrics & dashboards |
| Application | Python / Flask | REST API |

---

## 🚀 Deployment Runbook

### 1. Provision Infrastructure

```bash
cd infra/terraform
terraform init
terraform plan
terraform apply -auto-approve

2. Configure Servers

cd ../ansible
ansible-playbook -i inventory.ini playbook.yml

This installs:

Docker

Kubernetes dependencies

Node configurations



---

3. Initialize Kubernetes Cluster

sudo kubeadm init --pod-network-cidr=10.244.0.0/16
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml


---

☸️ Kubernetes Deployment Strategy

Rolling Updates → Zero-downtime deployment

Health Probes

Liveness → restart failed containers

Readiness → serve traffic only when ready


Load Distribution → Services balance traffic across pods



---

📊 Observability & Monitoring

Prometheus collects:

CPU & memory usage

Network traffic

Application latency


Grafana dashboards visualize:

Resource utilization

Pod health

Request throughput & errors



---

📂 Repository Structure

ci-cd-kubernetes-pipeline/
├── app/                 # Flask application
├── infra/
│   └── terraform/       # AWS provisioning
├── ansible/             # Configuration management
├── k8s/                 # Kubernetes manifests
├── monitoring/          # Prometheus & Grafana configs
├── Jenkinsfile          # CI/CD pipeline
└── docker/              # Docker setup


---

✅ What I Actually Implemented

Provisioned AWS EC2 infrastructure using Terraform

Built CI/CD pipeline using Jenkins

Containerized Flask application using Docker

Deployed application on Kubernetes cluster

Configured Prometheus & Grafana for monitoring

Tested rolling deployments and basic fault handling



---

⚠️ Challenges & Solutions

Kubernetes setup issues during cluster initialization
→ Resolved networking and kubeadm configuration

Deployment failures due to container misconfiguration
→ Fixed Docker build process and environment variables



---

📈 Key Outcomes

Automated end-to-end deployment pipeline

Reduced manual deployment effort

Built scalable and monitored application deployment system



---

🔮 Future Improvements

Deploy using AWS EKS

Implement auto-scaling

Add centralized logging (ELK stack)

Integrate Helm charts



---

👨‍💻 Author

Shreyas Neelaraddi
Cloud & DevOps Engineer

GitHub: https://github.com/ShreyasVN

---
