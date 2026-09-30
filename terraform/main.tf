module "vpc" {
  source = "./modules/vpc"
}

resource "aws_ecr_repository" "threat_composer" {
  name                 = "threat-composer-eks"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "eks-threat-composer"
  }
}
