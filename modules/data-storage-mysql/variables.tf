variable "db_name" {
  description = "name for db"
  type = string
}

variable "db_username" {
  description = "The username of the db"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "db password"
  type = string
  sensitive = true
}

variable "port" {
  description = "db port"
  type = number
}

variable "protocol" {
  description = "protocol"
  type = string
}

variable "environment" {
  description = "name of environment deploying to"
  type = string
}
