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

module "mysql" {
  source = "../../modules/data-storage-mysql"
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  port = 3306
  protocol = "tcp"
  environment = "dev"
}
