# Cloud-Base: Secure AWS Infrastructure Automation

![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?style=flat-square&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=flat-square&logo=amazon-aws)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Pipeline-blue?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

# ⚡ Cloud-Base: Secure AWS Infrastructure Automation

## ☁️ Project Overview

Cloud-Base is an Infrastructure as Code (IaC) project designed to provision a secure, scalable, and automated cloud environment on AWS using Terraform.  
This project demonstrates a production-ready approach to cloud infrastructure, featuring a custom Virtual Private Cloud (VPC), automated compute provisioning with bootstrapping scripts, and secure storage solutions. It removes the need for manual AWS console configuration, ensuring reproducibility and reducing human error.

---

## 🚀 Key Features

- **Custom Network Architecture**: A bespoke VPC with public subnets, internet gateways, and custom route tables to manage traffic flow.
- **Compute Automation**: Fully automated provisioning of EC2 instances using User Data to install and configure Apache on launch.
- **Security First**:
  - **Network Security**: Security Groups and NACLs tightly control inbound/outbound traffic.
  - **Access Control**: Automated TLS key pair generation for secure SSH access.
- **Storage**: Integrated S3 buckets for scalable object storage.
- **DevOps Best Practices**:
  - Remote state management using **S3 + DynamoDB** for state locking and collaboration.
  - CI/CD–friendly structure that supports Git-based automation.

---

## 🛠️ Tech Stack

- **Cloud Provider**: AWS  
- **Infrastructure as Code**: Terraform  
- **Scripting**: Bash (User Data)  
- **Version Control**: Git  
- **Web Server**: Apache HTTP Server  

---

## ⚡ Getting Started

### Prerequisites
- Terraform v1.0+
- AWS CLI configured with valid AWS credentials

### Installation & Deployment

**Clone the Repository**  
    git clone https://github.com/KendyReriani17/Cloud-Base.git  
    cd Cloud-Base

**Initialize Terraform**  
    terraform init

**Plan and Apply**  
    terraform plan  
    terraform apply --auto-approve

**Verify**  
Copy the `public_ip` output from Terraform and paste it in your browser to view the deployed web server.

### Cleanup
    terraform destroy

- **Custom Network Architecture**: A bespoke VPC with public subnets, internet gateways, and custom route tables to manage traffic flow.
- **Compute Automation**: Fully automated provisioning of EC2 instances using User Data to install and configure Apache on launch.
- **Security First**:
  - **Network Security**: Security Groups and NACLs tightly control inbound/outbound traffic.
  - **Access Control**: Automated TLS key pair generation for secure SSH access.
- **Storage**: Integrated S3 buckets for scalable object storage.
- **DevOps Best Practices**:
  - Remote state management using **S3 + DynamoDB** for state locking and collaboration.
  - CI/CD–friendly structure that supports Git-based automation.

---

## 🛠️ Tech Stack

- **Cloud Provider**: AWS  
- **Infrastructure as Code**: Terraform  
- **Scripting**: Bash (User Data)  
- **Version Control**: Git  
- **Web Server**: Apache HTTP Server  

---

## ⚡ Getting Started

### Prerequisites
- Terraform v1.0+
- AWS CLI configured with valid AWS credentials

### Installation & Deployment

**Clone the Repository**
