output "ecr_repository_url" {
  value = aws_ecr_repository.threat_composer.repository_url
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "load_balancer_controller_role_arn" {
  value = module.irsa.load_balancer_controller_role_arn
}
