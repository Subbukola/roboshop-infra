terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

   backend "s3" {
    bucket         = "roboshop-infra-development"
    key            = "roboshop-bastion-sg_rules"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

