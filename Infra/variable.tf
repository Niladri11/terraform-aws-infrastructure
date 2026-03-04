variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
 }

variable "subnet_cidr" {
  description = "CIDR block for Subnet"
  type        = string
 }

variable "availability_zone" {
  description = "Availability Zone for subnet"
  type        = string
}



variable "ami_id" {
  description = "AMI id of EC2"
  type        = string
  }

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
 }


variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "instance_name" {
  description = "Name tag for EC2"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}
