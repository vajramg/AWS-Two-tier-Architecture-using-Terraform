variable "ami" {
  type        = string
  description = "value of ami"
}

variable "key_name" {
  type        = string
  description = "value key-name"
}

variable "webservers_sg" {
  type        = string
  description = "value of webserver-sg security group"

}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "pri-subnet-1" {
  type        = string
  description = "value of pri-subnet1"
}

variable "pri-subnet-2" {
  type        = string
  description = "value of pri-subnet2"
}

variable "vpc_id" {
  type        = string
  description = "value of vpc id"
}

variable "target_group_arn" {
  type        = string
  description = "value of arn"

}

