terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  db_name = var.db_name
  username = var.db_username
  password = var.db_password
  db_subnet_group_name = module.vpc.database_subnet.id
  skip_final_snapshot = true
}

resource "aws_security_group" "db" {
    name = var.db_name
}

resource "aws_security_group_rule" "allow_app" {
  type = "ingress"
  security_group_id = aws_security_group.db.id

  from_port   = var.port
  to_port     = var.port
  protocol  = var.protocol
}

module "vpc" {
  source = "../networking-vpc"
  vpc_name = "webserver-${var.environment}"
  vpc_cidr = "10.0.0.0/16"
  subnet_public = "10.0.1.0/24"
  subnet_application_subnet = "10.0.101.0/24"
  subnet_database_subnet = "10.0.102.0/24"
}
