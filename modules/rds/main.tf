resource "aws_db_subnet_group" "dbsubnet" {
  name       = "dbsubnet"
  subnet_ids = [var.pri-subnet-3, var.pri-subnet-4]

  tags = {
    Name = "My-db subnet group"
  }
}

resource "aws_ssm_parameter" "db_username" {
  name        = "my-db-username"
  type        = "SecureString"
  value       = "admin"
  description = "RDS master username"
  tags = {
    name = "my-db-username"
  }
}

resource "aws_ssm_parameter" "db_password" {
  name        = "my-db-password"
  type        = "SecureString"
  value       = "Whitem00n@123"
  description = "RDS master password"
  tags = {
    name = "my-db-password"
  }
}

resource "aws_db_instance" "example" {
  instance_class          = "db.t3.micro"
  engine                  = "mysql"
  engine_version          = "5.7.44"
  username                = aws_ssm_parameter.db_username.value
  password                = aws_ssm_parameter.db_password.value
  db_name                 = var.db_name
  multi_az                = true
  allocated_storage       = 20
  storage_type            = "gp2"
  storage_encrypted       = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 0

  vpc_security_group_ids = [var.db_sg]
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.name

  tags = {
    name = "my-db"
  }
}
