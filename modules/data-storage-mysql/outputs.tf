output "address" {
  value = aws_db_instance.example.address
  description = "connect to db at this endpoint"
}

output "port" {
  value = aws_db_instance.example.port
  description = "port"
}
