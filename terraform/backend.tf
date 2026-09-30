terraform {
  backend "s3" {
    bucket       = "dish-eks-project-tfstate-bucket"
    key          = "eks/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
