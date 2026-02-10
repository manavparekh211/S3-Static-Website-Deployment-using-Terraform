# 🚀 Terraform on AWS: Infrastructure as Code Guide

> **Deploy cloud infrastructure with confidence using Terraform and AWS**

---

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Configuration Examples](#configuration-examples)
- [Deployment](#deployment)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)
- [Resources](#resources)

---

## 🎯 Overview

This guide demonstrates how to use **Terraform** to provision and manage AWS infrastructure as code. Terraform enables you to define, preview, and deploy cloud infrastructure using declarative configuration files.

### Key Benefits
✅ Infrastructure as Code (IaC)  
✅ Version control for infrastructure  
✅ Reproducible deployments  
✅ Easy scaling and updates  
✅ Cost optimization visibility  

---

## 📦 Prerequisites

Before you begin, ensure you have:

- **Terraform** (v1.0+) - [Download](https://www.terraform.io/downloads.html)
- **AWS Account** with appropriate permissions
- **AWS CLI** configured with credentials
- **Git** for version control
- **Text Editor** (VS Code recommended)

```bash
# Verify installations
terraform -v
aws --version
```

---

## 🔧 Getting Started

### 1. Initialize Your Terraform Project

```bash
mkdir terraform-aws-project
cd terraform-aws-project
terraform init
```

### 2. Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID and Secret Access Key
```

### 3. Create Your First Configuration

Create a `main.tf` file:

```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

---

## 📁 Project Structure

```
terraform-aws-project/
├── main.tf              # Primary configuration
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable values
├── vpc.tf               # VPC configuration
├── security_groups.tf   # Security groups
├── instances.tf         # EC2 instances
├── s3.tf                # S3 buckets
└── .terraform/          # Terraform working directory
```

---

## 💻 Configuration Examples

### EC2 Instance

```hcl
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "web-server"
  }
}
```

### S3 Bucket

```hcl
resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-app-bucket-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "app-bucket"
    Environment = var.environment
  }
}
```

### VPC & Subnet

```hcl
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public-subnet"
  }
}
```

---

## 🚀 Deployment

### Plan Your Infrastructure

```bash
# Review what Terraform will create
terraform plan -out=tfplan
```

### Apply Configuration

```bash
# Create/update infrastructure
terraform apply tfplan
```

### View Outputs

```bash
# Display output values
terraform output
```

### Destroy Infrastructure

```bash
# Remove all resources (use with caution!)
terraform destroy
```

---

## ⭐ Best Practices

### 1. **State Management**
```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

### 2. **Variables**
```hcl
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 1
}
```

### 3. **Outputs**
```hcl
output "instance_public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web_server.public_ip
  sensitive   = false
}
```

### 4. **General Guidelines**
- ✅ Use remote state for team collaboration
- ✅ Implement state locking to prevent conflicts
- ✅ Use workspaces for multiple environments
- ✅ Keep credentials in `.tfvars` (never commit to Git)
- ✅ Use meaningful `tags` for resource organization
- ✅ Enable S3 versioning for state backups
- ✅ Use `terraform fmt` to format code
- ✅ Run `terraform validate` before deployment

---

## 🐛 Troubleshooting

### Invalid Credentials
```
Error: Error configuring the AWS Provider
```
**Solution:** Run `aws configure` and verify your credentials

### State Lock Issues
```
Error: Error acquiring the state lock
```
**Solution:** Check DynamoDB for locks and remove if stale

### Resource Already Exists
```
Error: resource already exists
```
**Solution:** Import existing resources or destroy and recreate

---

## 📚 Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)

---

## 📝 License

This project is licensed under the MIT License.

---

**Happy Terraforming! 🎉**
