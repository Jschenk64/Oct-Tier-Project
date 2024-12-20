locals {
  instance_type = {
    dev                  = "t2.xlarge"
    prod                 = "t2.large"
    default              = "t2.micro"
    workflow             = "t2.2xlarge"
  }
}


resource "aws_instance" "ec2type" {
  ami = "ami-0a628e1e89aaedf80"
  instance_type = lookup(local.instance_type, terraform.workspace, "t2.micro")
}
