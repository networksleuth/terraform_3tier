terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "asg" {
  source = "../autoscaling"

  cluster_name = "webserver-${var.environment}"
  ami = var.ami
  instance_type = var.instance_type

  min_size = var.min_size
  max_size = var.max_size
  enable_autoscaling = var.enable_autoscaling

  subnet_ids = module.vpc.application_subnet.id
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

}

module "alb" {
  source = "../networking-alb"
  alb_name = "webserver-${var.environment}"
  subnet_ids = module.vpc.public_subnets.id
}

module "vpc" {
  source = "../networking-vpc"
  vpc_name = "webserver-${var.environment}"
  vpc_cidr = "10.0.0.0/16"
  subnet_public = "10.0.1.0/24"
  subnet_application_subnet = "10.0.101.0/24"
  subnet_database_subnet = "10.0.102.0/24"
}

resource "aws_lb_target_group" "asg" {
  name = "webserver-${var.environment}"
  port = var.server_port
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = module.alb.alb_http_listener_arn
  priority = 100

  condition {
    path_pattern {
      values = ["*"]
      }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }
}
