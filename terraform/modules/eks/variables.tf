variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs for the EKS managed node group"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet IDs available to the EKS cluster"
  type        = list(string)
}
