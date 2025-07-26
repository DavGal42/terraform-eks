# Terraform AWS Infrastructure

This repository contains a modular Terraform setup for deploying infrastructure on AWS, split into two main components:

- **terraform-backend** – Sets up an S3 bucket and DynamoDB table for Terraform remote state storage
- **terraform-eks** – Deploys an EKS cluster along with the necessary VPC and networking components

---

## Project Structure

```
└── terraform-backend
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
└── terraform-eks
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    └── variables.tf
```

## Installation Guide

### 1. Install AWS CLI and configure it.

```
aws configure
```

### 2. Go to ```terraform-backend/``` and configure files.

### 3. Install Backend.

```
terraform init
terraform validate
terraform fmt
terraform apply --auto-approve
```

### 4. Go to ```terraform-eks/``` and configure files.

### 5. Install EKS Cluster and other necessary components.

```
terraform init
terraform validate
terraform fmt
terraform apply --auto-approve
```

### 6. Go to your AWS account and check if resources are created.
