#terraform {
#  backend "s3" {
#    bucket         = "dav-gal-yan-terraform-backend"
#    key            = "eks/terraform.tfstate"
#    region         = var.aws_region
#    dynamodb_table = "terraform-locks"
#    encrypt        = true
#  }
#}
#

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.0.3"

  name                   = var.cluster_name
  kubernetes_version     = var.k8s_version
  endpoint_public_access = var.enable_public_access

  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = var.eks_tags
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = var.vpc_name
  cidr = var.cidr

  azs = var.azs

  private_subnets = [
    cidrsubnet("10.0.0.0/16", 4, 0),
    cidrsubnet("10.0.0.0/16", 4, 1),
    cidrsubnet("10.0.0.0/16", 4, 2)
  ]

  public_subnets = [
    cidrsubnet("10.0.0.0/16", 8, 48),
    cidrsubnet("10.0.0.0/16", 8, 49),
    cidrsubnet("10.0.0.0/16", 8, 50)
  ]

  enable_nat_gateway = var.enable_nat_gw
  single_nat_gateway = var.single_nat_gw

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = var.vpc_tags
}

