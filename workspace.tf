locals {
  mapped_workspace = {
    "my-instances-workflow" = "prod"
  }
  instance_type = {
    dev  = "t2.micro"
    prod = "t2.large"
    test = "t2.small"
  }
}

resource "aws_instance" "ec2type" {
  instance_type = local.instance_type[local.mapped_workspace[terraform.workspace]]
}


resource "aws_instance" "ec2type" {
    ami = "ami-0a628e1e89aaedf80"
    instance_type = local.instance_type[terraform.workspace]
  
}
