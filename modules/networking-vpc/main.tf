terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet_public
  map_public_ip_on_launch = true
}

resource "aws_subnet" "application_subnet" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet_application_subnet
  map_public_ip_on_launch = false
}

resource "aws_subnet" "database_subnet" {
  vpc_id = aws_vpc.example.id
  cidr_block = var.subnet_database_subnet
  map_public_ip_on_launch = false
}
