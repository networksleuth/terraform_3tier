output "alb_dns_name" {
  value = module.webserver.alb_dns_name
  description = "domain name of lb"
}
