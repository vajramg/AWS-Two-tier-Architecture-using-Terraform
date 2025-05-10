variable "cidr_block" {
  type        = string
  description = "value of VPC cidr"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "pub-subnet-1" {
  type        = string
  description = "value of public-subnet1"
}

variable "pub-subnet-2" {
  type        = string
  description = "value of public-subnet2"
}

variable "pri-subnet-1" {
  type        = string
  description = "value of pri-subnet1"
}

variable "pri-subnet-2" {
  type        = string
  description = "value of pri-subnet2"
}

variable "pri-subnet-3" {
  type        = string
  description = "value of pri-subnet3"
}

variable "pri-subnet-4" {
  type        = string
  description = "value of pri-subnet4"
}

variable "key_name" {
  type        = string
  description = "value of key name"
}

variable "ami" {
  type        = string
  description = "value of ami"
}

variable "db_name" {
  type        = string
  description = "value of db name"
}

variable "domain_name" {
  type        = string
  description = "domain name"
}

variable "CERTIFICATE_DOMAIN_NAME" {
  type        = string
  description = "certificte domain name"

}

variable "ADDITIONAL_DOMAIN_NAME" {
  type        = string
  description = "additional domain name"

}

variable "ALB_DOMAIN_NAME" {
  type        = string
  description = "alb domain name"

}
