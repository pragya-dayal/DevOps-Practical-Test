vpc_name             = "devops-practical-vpc"
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["eu-west-1a", "eu-west-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true

tags = {
  Environment = "dev"
  Project     = "DevOps Practical"
}

alb_name = "devops-practical"

alb_ingress_rules = {
  all_http = {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    description = "HTTP web traffic"
    cidr_ipv4   = "0.0.0.0/0"
  }
  all_https = {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    description = "HTTPS web traffic"
    cidr_ipv4   = "0.0.0.0/0"
  }
}

alb_egress_rules = {
  all = {
    ip_protocol = "-1"
    cidr_ipv4   = "0.0.0.0/0"
  }
}

acm_certificate_arn = "arn:aws:acm:eu-west-1:343218196271:certificate/9c3205aa-4d85-41e2-a2d8-7441a6351a55"

target_group_name = "ECS-target-group"

route53_record_name = "pragya.devops.com"

route53_record_ttl = "300"

route53_zone_name   = "devops.com"
route53_private_zone = false