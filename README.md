# Terraform-aws-infrastructure

This project demonstrates how to automate AWS infrastructure provisioning using Terraform.

The infrastructure includes:
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- S3 Bucket
- Remote Terraform State using S3

---

## Project Structure

bootstrap/
Creates backend infrastructure for Terraform state:
- S3 bucket
- DynamoDB table (for state locking)

infra/
Creates the main AWS infrastructure:
- VPC
- Subnet
- Security Group
- EC2 Instance
- S3 bucket

---

## Prerequisites

- AWS account
- AWS CLI installed
- Terraform installed
- AWS credentials configured


AWS configure
---

## Step 1: Create Backend Infrastructure

Navigate to bootstrap folder:
```
cd bootstrap
terraform init
terraform apply
```

This creates:
- S3 bucket for Terraform state
- DynamoDB table for state locking

---

## Step 2: Deploy Infrastructure

Navigate to infra folder:
```
cd ../infra
terraform init
terraform plan
terraform apply
```

Terraform will automatically provision:

- VPC
- Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- S3 Bucket

---

## Output

After deployment Terraform outputs the EC2 public IP address.

Example:
```
ec2_public_ip = xx.xx.xx.xx
```
You can SSH into the instance using:
```
ssh -i your-key.pem ubuntu@<public-ip>
```

---

## Cleanup

To destroy the infrastructure:
```
terraform destroy
```

---

## Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS S3
- AWS DynamoDB
