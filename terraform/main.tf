module "vpc" {
  source = "./modules/vpc"
}

resource "aws_ecr_repository" "threat_composer" {
  name                 = "threat-composer-eks"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "eks-threat-composer"
  }
}

module "eks" {
  source = "./modules/eks"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  public_subnets  = module.vpc.public_subnet_ids
}

module "irsa" {
  source = "./modules/irsa"

  oidc_provider_arn = module.eks.oidc_provider_arn
}
