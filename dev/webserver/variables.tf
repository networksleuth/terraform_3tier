variable "environment" {
  description = "The name of environment to deploy"
  type = string
  default = "dev"
}

variable "ami" {
  description = "The ami to deploy"
  type = string
  #default set to ami ubuntu 20.04LTS us-east-1
  default = "ami-000722651477bd39b"
}
