output "vpc_id" {
  value = aws_vpc.example.id
  description = "vpc id"
}

output "vpc_cidr" {
  value = aws_vpc.example.cidr_block
  description = "vpc cidr block"
}

output "public_subnets" {
  value = aws_subnet.public.id
  description = "public subnet"
}

output "application_subnet" {
  value = aws_subnet.application_subnet.id
  description = "application subnet"
}

output "database_subnet" {
  value = aws_subnet.database_subnet.id
  description = "database subnet"
}
