output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "pri-subnet-1" {
  value = aws_subnet.pri-subnet-1.id
}

output "pri-subnet-2" {
  value = aws_subnet.pri-subnet-2.id
}

output "igw" {
  value = aws_internet_gateway.myigw.id
}

output "pri-subnet-3" {
  value = aws_subnet.pri-subnet-3.id
}

output "pri-subnet-4" {
  value = aws_subnet.pri-subnet-4.id
}

output "pub-subnet-1_id" {
  value = aws_subnet.pub-subnet-1.id
}

output "pub-subnet-2_id" {
  value = aws_subnet.pub-subnet-2.id
}


