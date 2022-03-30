variable "cluster_name" {
  description = "name of all cluster resources"
  type = string
}

variable "ami" {
  description = "ami to run autoscale cluster"
  type = string
}

variable "instance_type" {
  description = "type of ec2 to run"
  type = string
  default = "t3.micro"
}

variable "min_size" {
  description = "min number of ec2"
  type = number
}

variable "max_size" {
  description = "max number of ec2"
  type = number
}

variable "subnet_ids" {
  description = "subnet IDs to deploy to"
  type = list(string)
}

variable "enable_autoscaling" {
  description = "enable autoscale if true"
  type = bool
}

variable "target_group_arns" {
  description = "the ARNs of ELB target groups in register Instances"
  type = list(string)
  default = []
}

variable "health_check_type" {
  description = "The type of health check to perform"
  type = string
  default = "EC2"
}

variable "server_port" {
  description = "port server will use for http requests"
  type = number
  default = 8080
}
