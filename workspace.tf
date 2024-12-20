locals {
  instance_type = {
    dev                  = "t2.micro"
    prod                 = "t2.large"
    test                 = "t2.small"
    my-instances-workflow = "t3.medium"
  }
}

resource "aws_instance" "ec2type" {
    ami = "ami-0a628e1e89aaedf80"
    instance_type = local.instance_type[terraform.workspace]
  
}
