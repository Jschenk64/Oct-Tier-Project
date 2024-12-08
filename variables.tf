variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.49.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  default     = ["10.49.1.0/24", "10.49.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  default     = ["10.49.3.0/24", "10.49.4.0/24"]
}

variable "availability_zones" {
  description = "AWS Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "DVS_vpc"
}

variable "public_subnet_names" {
  description = "Names for the public subnets"
  default     = ["DVS_pub_sub_1", "DVS_pub_sub_2"]
}

variable "private_subnet_names" {
  description = "Names for the private subnets"
  default     = ["DVS_priv_sub_1", "DVS_priv_sub_2"]
}


variable "key_name" {
  description = "Key pair name for EC2 instances"
  default     = "eng-de"
}

variable "ec2_image" {
  description = "Amazon Machine Image ID"
  default     = "ami-0a628e1e89aaedf80"
}

variable "loadbalancer_name" {
  description = "Name of the Load Balancer"
  default     = "win24-lb"
}

variable "web_server_name" {
  description = "Name of the web server"
  default     = "BIE-SVWEB56"
}

variable "app_server_name" {
  description = "Name of the app server"
  default     = "BIE-SVAPP57"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  default     = "t2.micro"
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "staging"
    Project     = "win24"
  }
}





