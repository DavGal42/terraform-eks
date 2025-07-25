variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "k8s_version" {
  description = "Version of the Kubernetes"
  type        = string
  default     = "1.33"
}

variable "enable_public_access" {
  description = "Determines whether the Kubernetes API server is accessible from the public internet. If true, public access is enabled. If false, access is restricted to within the VPC (private access only)."
  type        = bool
  default     = true
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Gives the person who created the EKS cluster full admin access inside the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "eks_tags" {
  description = "Tags for EKS Cluster"
  type        = map(string)
  default = {
    Test = "my-eks-cluster"
  }
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my_vpc_for_eks"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "A list of availability zones where resources will be deployed."
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "enable_nat_gw" {
  description = "Defines whether to create a NAT Gateway for private subnets. If true, private subnets will be able to access the internet through the NAT."
  type        = bool
  default     = true
}

variable "single_nat_gw" {
  description = "If true, only a single NAT Gateway will be created for the entire VPC. If false, a NAT Gateway will be created in each availability zone."
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {
    Test = "my-vpc-for-eks-cluster"
  }
}
