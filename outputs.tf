output "mysql_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "ecr_repository_worker_endpoint" {
  value = aws_ecr_repository.ecr.repository_url
}