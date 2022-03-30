variable "alb_name" {
  description = "name to use for alb"
  type = string
}

variable "subnet_ids" {
  description = "subnet ids to deploy to"
  type = list(string)
}
