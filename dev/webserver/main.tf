terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver" {
  source = "../../modules/webserver"

  environment = var.environment

  instance_type = "t3.micro"
  min_size = 2
  max_size = 3
  enable_autoscaling = true
  ami = var.ami
  }
