output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.example.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.example.public_dns
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = aws_subnet.subnet1.id
}

output "security_group_id" {
  description = "ID of the Security Group"
  value       = aws_security_group.demo_sg.id
}
