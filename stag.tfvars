vpc_cidr             = "10.49.0.0/16"
public_subnet_cidrs  = ["10.49.101.0/24", "10.49.102.0/24"]
private_subnet_cidrs = ["10.49.103.0/24", "10.49.104.0/24"]
aws_region           = "eu-west-1"
availability_zones   = ["eu-west-1a", "eu-west-1b"]
key_name             = "win24"
ec2_image            = "ami-0e9085e60087ce171"


# Names for resources
vpc_name             = "Silo_vpc"
public_subnet_names  = ["Silo_pub_sub_1", "Silo_pub_sub_2"]
private_subnet_names = ["Silo_priv_sub_1", "Silo_priv_sub_2"]

# EC2 and Auto Scaling Configurations
web_server_name   = "IRE-SVWEB56"
app_server_name   = "IRE-SVAPP57"
loadbalancer_name = "Silo-lb"

# Instance Type
instance_type = "t2.micro"

# Tags for resources
tags = {
  Environment = "staging"
  Project     = "Silo"
}


