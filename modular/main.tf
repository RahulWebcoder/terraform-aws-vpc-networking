terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./modules/vpc"
  name       = "devops-vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source       = "./modules/subnets"
  name         = "devops"
  vpc_id       = module.vpc.vpc_id
  public_cidr  = "10.0.1.0/24"
  private_cidr = "10.0.2.0/24"
  az           = "us-east-1a"
}

module "nat" {
  source            = "./modules/nat-gateway"
  name              = "devops"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
}

terraform {
  backend "s3" {
    bucket         = "devops-tfstate-rahul-demo"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
