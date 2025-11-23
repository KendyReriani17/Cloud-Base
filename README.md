# Cloud-Base: Secure AWS Infrastructure Automation

![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?style=flat-square&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=flat-square&logo=amazon-aws)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Pipeline-blue?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

## ☁️ Project Overview

**Cloud-Base** is an Infrastructure as Code (IaC) project designed to provision a secure, scalable, and automated cloud environment on AWS using Terraform. 

This project demonstrates a production-ready approach to cloud infrastructure, featuring a custom Virtual Private Cloud (VPC) network, automated compute provisioning with bootstrapping scripts, and secure storage solutions. It eliminates manual console configuration, ensuring reproducibility and reducing human error.

## 🏗️ Architecture

The infrastructure is designed with security and modularity in mind.

```mermaid
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
