resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    self        = true
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    self        = true
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "webservers_sg" {
  vpc_id = var.vpc_id


  ingress {
    protocol        = "tcp"
    self            = true
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    protocol        = "tcp"
    self            = true
    from_port       = 443
    to_port         = 443
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "client-sg"
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = var.vpc_id


  ingress {
    protocol        = "tcp"
    self            = true
    from_port       = 3306
    to_port         = 3306
    security_groups = [aws_security_group.webservers_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "db-sg"
  }
}

resource "aws_security_group" "jump-server_sg" {
  vpc_id = var.vpc_id


  ingress {
    protocol    = "tcp"
    self        = true
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "jump-server_sg"
  }
}


