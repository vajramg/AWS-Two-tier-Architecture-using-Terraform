resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    name = "igw"
  }
}

data "aws_availability_zones" "availability_zones" {}

resource "aws_subnet" "pub-subnet-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pub-subnet-1
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true
  tags = {
    name = "pub-subnet1"
  }
}

resource "aws_subnet" "pub-subnet-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pub-subnet-2
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    name = "pub-subnet2"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    name = "public-rt"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.pub-subnet-1.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.pub-subnet-2.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_subnet" "pri-subnet-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pri-subnet-1
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    name = "pri-subnet1"
  }
}

resource "aws_subnet" "pri-subnet-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pri-subnet-2
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false


  tags = {
    name = "pri-subnet2"
  }
}

resource "aws_subnet" "pri-subnet-3" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pri-subnet-3
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    name = "pri-subnet3"
  }
}

resource "aws_subnet" "pri-subnet-4" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.pri-subnet-4
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    name = "pri-subnet-4"
  }
}
