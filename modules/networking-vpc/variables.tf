variable "vpc_name" {
  description = "name to use for vpc"
  type = string
}

variable "vpc_cidr" {
  description = "cidr for vpc"
  type = string
}

variable "subnet_public" {
  description = "cidr for public subnet"
  type = string
}

variable "subnet_application_subnet" {
  description = "cidr for application private subnets"
  type = string
}

variable "subnet_database_subnet" {
  description = "cidr for database private subnets"
}
