output "alb_dns_name" {
  value = module.alb.alb_dns_name
  description = "domain name of lb"
}

output "asg_name" {
  value = module.asg.asg_name
  description = "name of autoscaling group"
}

output "instance_security_group_id" {
  value = module.asg.instance_security_group_id
  description = "id of the ec2 security group"
}
