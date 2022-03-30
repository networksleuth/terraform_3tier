output "asg_name" {
  value = aws_autoscaling_group.example.name
  description = "name of autoscale group"
}

output "instance_security_group_id" {
  value = aws_security_group.instance.id
  description = "id of the ec2 security group"
}
