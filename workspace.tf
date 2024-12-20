locals {
  instance_type = {
    dev  = "t2.micro"
    prod = "t2.large"
    test = "t2.small"
  }
}

resource "aws_instance" "ec2type" {
  ami = "ami-0a628e1e89aaedf80"
  instance_type = lookup(local.instance_type, terraform.workspace, "t2.micro")
}
