output "load_balancer_controller_role_arn" {
  value = module.load_balancer_controller_irsa.iam_role_arn
}
