output "external_dns_role_arn" {
  value = module.external_dns_irsa.iam_role_arn
}
