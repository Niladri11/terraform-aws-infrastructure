provider "aws" {
  region = var.aws_region
}


# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
  Name = "demo_vpc"
  Owner   = "Niladri"
  }
  }

# Subnet
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "demo_subnet"
    Owner   = "Niladri"
  }
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "demo_igw"
  }
}

#Route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

#Route Table Association
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
# Security Group
resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.192.95.123/32"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo_sg"
  }
}

#ec_2
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
    Owner   = "Niladri"
  }
}



#s3 bucket
/*resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name
  region = "ap-south-1"
}*/

#backend
terraform {
  backend "s3" {
    bucket         = "terraform-demo-testing-2026-niladri"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
