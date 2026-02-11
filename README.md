# 🌐 S3 Static Website Deployment

A complete Terraform infrastructure-as-code solution for deploying and hosting a static website on **AWS S3** with production-ready configurations.

---

## 📋 Project Overview

This project demonstrates a modern DevOps approach to infrastructure management, leveraging Terraform to provision AWS resources for a highly available, scalable static website hosting solution.

**Key Features:**
- ✅ Infrastructure as Code (IaC) with Terraform
- ✅ AWS S3 bucket configuration for static website hosting
- ✅ Automated resource provisioning and management
- ✅ State management with Terraform state files
- ✅ Multi-provider support (AWS, Random)
- ✅ Organized outputs for easy resource reference

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│      AWS S3 Static Website Hosting      │
├─────────────────────────────────────────┤
│  • S3 Bucket Configuration              │
│  • Index & Error Document Handling      │
│  • Website Endpoint Exposure            │
│  • HTML Asset Storage                   │
└─────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
s3-static-website/
├── .gitignore             # Git ignore rules for Terraform
├── providers.tf           # AWS & Random provider configuration
├── s3.tf                  # S3 bucket and website setup
├── outputs.tf             # Output values for deployed resources
├── .terraform.lock.hcl    # Terraform dependency lock file
├── .terraform/            # Cached providers (not committed)
├── terraform.tfstate      # Infrastructure state (not committed)
├── terraform.tfstate.backup # State backup (not committed)
└── html-files/
    ├── index.html         # Main website page
    └── error.html         # Error page (404, etc.)
```

---

## 🚀 Quick Start

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS Account](https://aws.amazon.com/) with appropriate IAM permissions
- AWS CLI configured with credentials

### Installation & Deployment

1. **Clone or navigate to the project directory:**
   ```bash
   cd s3-static-website
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Preview the infrastructure changes:**
   ```bash
   terraform plan
   ```

4. **Deploy the infrastructure:**
   ```bash
   terraform apply
   ```

5. **Access your website:**
   - Retrieve the S3 website endpoint from outputs
   - Your static site is now live! 🎉

---

## 📤 Key Outputs

Once deployed, Terraform outputs important resource information:

- **S3 Bucket Name** - Your bucket identifier
- **Website Endpoint** - Public URL for your static website
- **Region** - AWS region where resources are deployed

View outputs anytime:
```bash
terraform output
```

---

## 🔧 Configuration Files Explained

### `providers.tf`
Configures AWS and Random providers for resource provisioning.

### `s3.tf`
Defines the S3 bucket configuration:
- Bucket creation and naming
- Static website hosting setup
- Index document specification (index.html)
- Error document handling (error.html)

### `outputs.tf`
Exposes critical resource attributes for easy reference and integration.

---

## 📝 HTML Files

**`index.html`** - Your main website landing page
**`error.html`** - Custom error page for HTTP errors (404, 403, etc.)

---

## 🔐 Best Practices Implemented

- ✅ Provider versioning with lock file
- ✅ Clear output definitions
- ✅ Modular file organization
- ✅ AWS best practices for S3 hosting
- ✅ Proper version control with .gitignore

---

## 🔒 Version Control

**Committed to Git:**
- Configuration files (*.tf)
- HTML assets
- .terraform.lock.hcl (dependency lock)
- .gitignore

**Excluded from Git (.gitignore):**
- *.tfstate files (contain sensitive data)
- .terraform/ directory (regenerated on init)
- *.tfvars files (may contain secrets)

---

## 🧹 Cleanup

To remove all deployed resources:
```bash
terraform destroy
```

---

## 📊 Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| **Terraform** | Latest | Infrastructure as Code |
| **AWS Provider** | 4.67.0 | Cloud Infrastructure |
| **Random Provider** | 3.8.1 | Resource Naming |

---

## 💡 Tips & Tricks

- Always run `terraform plan` before applying changes
- Keep `terraform.tfstate` secure (store in remote backend for teams)
- Use `terraform output` to retrieve deployed resource information
- Test locally before pushing to production

---

## 📚 Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS S3 Documentation](https://docs.aws.amazon.com/s3/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## 📄 License

This project is open source and available under the MIT License.
