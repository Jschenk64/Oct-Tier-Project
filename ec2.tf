resource "aws_autoscaling_group" "web_asg" {
  name = "BIE-SVWEB56-asg"
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  vpc_zone_identifier       = aws_subnet.public_subnet[*].id
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = var.web_server_name
    propagate_at_launch = true
  }
}


resource "aws_launch_template" "web_lt" {
  name          = "BIE-SVWEB56-lt"
  image_id      = var.ec2_image
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = base64encode(<<-EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl start nginx
    hostnamectl set-hostname BIE-SVWEB56
  EOF
  )

  network_interfaces {
    security_groups = [aws_security_group.web_sg.id]
  }

  tags = {
    Name = var.web_server_name
  }
}




resource "aws_security_group" "web_sg" {
  name        = "win24_web_sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name = "BIE-SVAPP57-asg"
  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  vpc_zone_identifier       = aws_subnet.private_subnet[*].id
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = var.app_server_name
    propagate_at_launch = true
  }
}


resource "aws_launch_template" "app_lt" {
  name          = "BIE-SVAPP57-lt"
  image_id      = var.ec2_image
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = base64encode(<<-EOF
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    hostnamectl set-hostname BIE-SVAPP57
  EOF
  )

  network_interfaces {
    security_groups = [aws_security_group.web_sg.id]
  }

  tags = {
    Name = var.app_server_name
  }
}


resource "aws_security_group" "app_sg" {
  name        = "BIE-SVAPP57-sg"
  description = "Allow communication from Web Tier to App Tier"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




