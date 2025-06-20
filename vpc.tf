# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "5.1.0"

#   name = "devops-practical-vpc"
#   cidr = var.vpc_cidr

#   azs             = var.azs
#   public_subnets  = var.public_subnets
#   private_subnets = var.private_subnets

#   enable_nat_gateway     = true
#   single_nat_gateway     = true
#   enable_dns_hostnames   = true
#   enable_dns_support     = true
# }


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"
  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.availability_zones
  public_subnets     = var.public_subnet_cidrs
  private_subnets    = var.private_subnet_cidrs
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = var.tags
}