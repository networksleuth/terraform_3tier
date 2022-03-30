variable "environment" {
  description = "name of environment deploying to"
  type = string
}

variable "min_size" {
  description = "min number of EC2 in autoscale"
  type = number
}

variable "max_size" {
  description = "max number of EC2 in autoscale"
  type = number
}

variable "enable_autoscaling" {
  description = "if set to true enable autoscale"
  type = bool
}

variable "ami" {
  description = "The ami to deploy"
  type = string
  default = "ami-000722651477bd39b"
}

variable "instance_type" {
  description = "type of instance to run"
  type = string
}

variable "server_port" {
  description = "port servers will use for requests"
  type = number
  default = 8080
}
