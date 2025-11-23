Cloud-Base: Secure AWS Infrastructure Automation

☁️ Project Overview

Cloud-Base is an Infrastructure as Code (IaC) project designed to provision a secure, scalable, and automated cloud environment on AWS using Terraform.

This project demonstrates a production-ready approach to cloud infrastructure, featuring a custom Virtual Private Cloud (VPC) network, automated compute provisioning with bootstrapping scripts, and secure storage solutions. It eliminates manual console configuration, ensuring reproducibility and reducing human error.

🏗️ Architecture

The infrastructure is designed with security and modularity in mind.

graph TD
    User((User/Internet)) --> IGW[Internet Gateway]
    IGW --> RT[Route Table]
    subgraph VPC [Custom VPC]
        RT --> PubSub[Public Subnet]
        subgraph Security [Security Layer]
            SG[Security Groups] --> NACL[Network ACLs]
        end
        PubSub --> SG
        SG --> EC2[EC2 Instance (Apache Web Server)]
    end
    EC2 --> S3[S3 Bucket (Storage)]
    Terraform[Terraform CLI] -.->|Provisions| VPC


🚀 Key Features

Custom Network Architecture: Deployed a bespoke VPC with public subnets, internet gateways, and custom route tables to manage traffic flow.

Compute Automation: Automated the provisioning of EC2 instances, utilizing User Data scripts to install and configure an Apache web server upon launch.

Security First:

Network Security: Implemented robust Security Groups and Network ACLs (NACLs) to strictly control inbound and outbound traffic.

Access Control: Automated TLS key pair generation for secure SSH access.

Storage: Integrated S3 buckets for scalable object storage.

DevOps Best Practices:

Remote State Management: Configured remote state storage (S3 + DynamoDB locking) to enable team collaboration and prevent state corruption.

CI/CD Integration: Structure supports integration with Git pipelines for automated infrastructure updates.

🛠️ Tech Stack

Cloud Provider: Amazon Web Services (AWS)

Infrastructure as Code: Terraform

Scripting: Bash (User Data)

Version Control: Git

Web Server: Apache HTTP Server

📂 Project Structure

Cloud-Base/
├── modules/               # Reusable Terraform modules (Optional)
├── main.tf                # Main configuration entry point
├── variables.tf           # Input variables for customization
├── outputs.tf             # Output values (e.g., EC2 Public IP, S3 Bucket Name)
├── vpc.tf                 # VPC, Subnets, and Networking resources
├── security.tf            # Security Groups and Key Pairs
├── storage.tf             # S3 Bucket configurations
├── compute.tf             # EC2 instances and User Data
├── provider.tf            # AWS Provider and Backend configuration
└── scripts/
    └── install_apache.sh  # Bootstrapping script for EC2


⚡ Getting Started

Prerequisites

Terraform installed (v1.0+).

AWS CLI configured with appropriate credentials.

Installation & Deployment

Clone the Repository

git clone [https://github.com/KendyReriani17/Cloud-Base.git](https://github.com/KendyReriani17/Cloud-Base.git)
cd Cloud-Base


Initialize Terraform
Downloads the required providers and initializes the backend.

terraform init


Plan the Deployment
Preview the changes Terraform will make to your AWS account.

terraform plan


Apply Infrastructure
Provision the resources.

terraform apply --auto-approve


Access the Web Server
After deployment, Terraform will output the public IP of the EC2 instance. Paste this IP into your browser to view the hosted Apache page.

Cleanup (Destroy)
To avoid incurring AWS costs, destroy the resources when finished.

terraform destroy


🔄 CI/CD Workflow

This project is designed to integrate with CI/CD tools (e.g., Jenkins, GitHub Actions).

Code Commit: Developer pushes changes to a feature branch.

Plan: CI pipeline runs terraform plan and reports changes on the Pull Request.

Apply: Upon merge to main, the pipeline runs terraform apply to update the live infrastructure.
