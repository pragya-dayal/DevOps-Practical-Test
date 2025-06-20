# variable "aws_region" {
#   description = "The AWS region to deploy resources in"
#   type        = string
#   default     = "eu-west-1"
# }

# variable "vpc_cidr" {
#   description = "CIDR block for the VPC"
#   type        = string
#   default     = "10.0.0.0/16"
# }

# variable "azs" {
#   description = "List of availability zones"
#   type        = list(string)
#   default     = ["eu-west-1a", "eu-west-1b"]
# }

# variable "public_subnets" {
#   description = "List of public subnet CIDRs"
#   type        = list(string)
#   default     = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# variable "private_subnets" {
#   description = "List of private subnet CIDRs"
#   type        = list(string)
#   default     = ["10.0.3.0/24", "10.0.4.0/24"]
# }


variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "alb_name"{}

variable "alb_ingress_rules"{}

variable "alb_egress_rules"{}

variable "acm_certificate_arn"{}

variable "target_group_name"{}

variable "route53_record_name" {}

variable "route53_record_ttl" {}

variable "route53_private_zone" {}

variable "route53_zone_name" {}