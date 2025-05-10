module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.cidr_block
  pub-subnet-1 = var.pub-subnet-1
  pub-subnet-2 = var.pub-subnet-2
  pri-subnet-1 = var.pri-subnet-1
  pri-subnet-2 = var.pri-subnet-2
  pri-subnet-3 = var.pri-subnet-3
  pri-subnet-4 = var.pri-subnet-4
  project_name = var.project_name
}

module "nat" {
  source       = "./modules/nat"
  pub-subnet-1 = module.vpc.pub-subnet-1_id
  pub-subnet-2 = module.vpc.pub-subnet-2_id
  pri-subnet-1 = module.vpc.pri-subnet-1
  pri-subnet-2 = module.vpc.pri-subnet-2
  pri-subnet-3 = module.vpc.pri-subnet-3
  pri-subnet-4 = module.vpc.pri-subnet-4
  vpc_id       = module.vpc.vpc_id
  igw          = module.vpc.igw
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "asg" {
  source           = "./modules/asg"
  vpc_id           = module.vpc.vpc_id
  pri-subnet-1     = module.vpc.pri-subnet-1
  pri-subnet-2     = module.vpc.pri-subnet-2
  project_name     = var.project_name
  key_name         = var.key_name
  webservers_sg    = module.sg.webservers_sg_id
  ami              = var.ami
  target_group_arn = module.alb.target_group_arn
}

module "rds" {
  source       = "./modules/rds"
  pri-subnet-3 = module.vpc.pri-subnet-3
  pri-subnet-4 = module.vpc.pri-subnet-4
  db_name      = var.db_name
  db_sg        = module.sg.db_sg_id
}

module "alb" {
  source          = "./modules/alb"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  alb_sg_id       = module.sg.alb_sg_id
  pub-subnet-1_id = module.vpc.pub-subnet-1_id
  pub-subnet-2_id = module.vpc.pub-subnet-2_id
}

module "Cloudfront" {
  source                  = "./modules/cloudfront"
  project_name            = var.project_name
  domain_name             = var.domain_name
  CERTIFICATE_DOMAIN_NAME = var.CERTIFICATE_DOMAIN_NAME
  ADDITIONAL_DOMAIN_NAME  = var.ADDITIONAL_DOMAIN_NAME
  ALB_DOMAIN_NAME         = var.ALB_DOMAIN_NAME
}

module "route53" {
  source = "./modules/route53"


}
