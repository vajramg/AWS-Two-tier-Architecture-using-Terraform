output "webservers_sg_id" {
  value = aws_security_group.webservers_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
