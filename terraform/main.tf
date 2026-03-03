provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.micro"
  vpc_id ="vpc-008b2600edb49b38b"
  subnet_id = "subnet-0792853cf6597affe"
  key_value = "demo1"

  tags = {
    Name = "Terraform-testing"
  }
}
