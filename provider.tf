terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "two-tier"
    key    = "dev/dev.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true 
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}