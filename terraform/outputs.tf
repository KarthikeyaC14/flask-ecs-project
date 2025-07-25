output "load_balancer_dns" {
  description = "The DNS name of the application load balancer."
  value       = aws_lb.main_alb.dns_name
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.flask_app_repo.repository_url
}

