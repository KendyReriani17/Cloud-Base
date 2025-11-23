# ⚡ Cloud-Base: AWS Infrastructure Automation with Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?style=flat-square&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=flat-square&logo=amazon-aws)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Pipeline-blue?style=flat-square)
![Git](https://img.shields.io/badge/Git-Version_Control-black?logo=git)
![Apache](https://img.shields.io/badge/Apache-Web_Server-red?logo=apache)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)


## ☁️ Overview
Cloud-Base is an Infrastructure as Code (IaC) project designed to build a secure, scalable, and automated AWS environment using Terraform.  
The project automates network setup, compute provisioning, storage, and security—removing the need for manual AWS console configuration.

---

## 🚀 Key Features

- Custom VPC with subnets, route tables, and an Internet Gateway  
- EC2 instances auto-configured with an Apache web server (via User Data scripts)  
- Strict inbound/outbound rules using Security Groups and NACLs  
- Automated SSH key pair creation  
- S3 bucket provisioning for reliable object storage  
- Remote Terraform state stored in S3 + DynamoDB locking  
- CI/CD-ready folder and module structure  

---

## 🛠️ Tech Stack

- AWS  
- Terraform  
- Bash (User Data scripting)  
- Git  
- Apache HTTP Server  

---

## ⚡ Getting Started

### Prerequisites
- Terraform v1.0+ installed  
- AWS CLI configured with valid credentials  

---

## 🚀 Deployment Steps

Clone the repository:  
    git clone https://github.com/KendyReriani17/Cloud-Base.git  
    cd Cloud-Base

Initialize Terraform:  
    terraform init

Review the execution plan:  
    terraform plan

Apply the infrastructure:  
    terraform apply --auto-approve

Verify deployment:  
Copy the **public_ip** output from Terraform and paste it into your browser to view the Apache server.

---

## 🧹 Cleanup Resources

    terraform destroy
