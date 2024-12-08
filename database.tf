resource "aws_db_instance" "rds_instance" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "win24_db"
  username               = "admin"
  password               = "password123"
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  # Skip final snapshot
  skip_final_snapshot = true
}


resource "aws_security_group" "db_sg" {
  name        = "win24_db_sg"
  description = "Allow access to database"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "main_db_subnet_group"
  subnet_ids = aws_subnet.private_subnet[*].id # Ensure these are private subnets in the same VPC
  tags = {
    Name = "main_db_subnet_group"
  }
}

