module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.name
  cluster_version = "1.35"


  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = true

  access_entries = {
    github_deploy = {
      principal_arn = "arn:aws:iam::142969859154:role/eks-threat-composer-github-deploy"

      policy_associations = {
        cluster_admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  enable_irsa = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.public_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["m7i-flex.large"]
  }

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = local.tags
}
