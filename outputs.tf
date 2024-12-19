output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = aws_subnet.private_subnet[*].id
}

output "web_server_public_ip" {
  description = "Public IP addresses of the web server instances"
  value       = [for instance in data.aws_instance.web_instance : instance.public_ip]
}


output "app_server_private_ip" {
  description = "Private IP addresses of the app server instances"
  value       = [for instance in data.aws_instance.app_instance : instance.private_ip]
}

output "load_balancer_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.app_lb.arn
}

output "db_password" {
  value     = aws_db_instance.rds_instance.password
  sensitive = true
}



