locals {
  instance_type = {
    default = "t2.nano"
    dev = "t2.micro"
    prod = "m5.large"
  }
}

resource "aws_instance" "ec2type" {
    ami = "ami-0a628e1e89aaedf80"
    instance_type = local.instance_type[terraform.workspace]
  
}