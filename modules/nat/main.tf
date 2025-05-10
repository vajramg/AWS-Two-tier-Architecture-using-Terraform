resource "aws_eip" "eip1" {
  domain = "vpc"

  tags = {
    eip = "eip-1"
  }
}

resource "aws_eip" "eip2" {
  domain = "vpc"

  tags = {
    eip = "eip-2"
  }
}

resource "aws_nat_gateway" "mynat1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.pub-subnet-1

  tags = {
    Name = "natgw-subnet-1"
  }

  depends_on = [var.igw]
}

resource "aws_nat_gateway" "mynat2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = var.pub-subnet-2

  tags = {
    Name = "natgw-subnet-2"
  }

  depends_on = [var.igw]
}

resource "aws_route_table" "pri-rt1" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynat1.id
  }

  tags = {
    name = "pri-rt1"
  }
}

resource "aws_route_table" "pri-rt2" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynat2.id
  }

  tags = {
    name = "pri-rt2"
  }
}

resource "aws_route_table_association" "pri-rta1" {
  subnet_id      = var.pri-subnet-1
  route_table_id = aws_route_table.pri-rt1.id
}

resource "aws_route_table_association" "pri-rta2" {
  subnet_id      = var.pri-subnet-2
  route_table_id = aws_route_table.pri-rt2.id
}

resource "aws_route_table_association" "pri-rta3" {
  subnet_id      = var.pri-subnet-3
  route_table_id = aws_route_table.pri-rt1.id
}

resource "aws_route_table_association" "pri-rta4" {
  subnet_id      = var.pri-subnet-4
  route_table_id = aws_route_table.pri-rt2.id
}

