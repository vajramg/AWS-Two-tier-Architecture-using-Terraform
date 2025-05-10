variable "pri-subnet-3" {
  type        = string
  description = "value of pri-subnet3"
}

variable "pri-subnet-4" {
  type        = string
  description = "value of pri-subnet4"
}

variable "db_name" {
  default = "test"
}

variable "db_sg" {
  type        = string
  description = "value of db security group"
}
