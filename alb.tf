module "alb" {
  source = "terraform-aws-modules/alb/aws"
  version = "9.12.0"
  name   = var.alb_name
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  security_group_ingress_rules = var.alb_ingress_rules
  security_group_egress_rules  = var.alb_egress_rules
  

  listeners = {
    http = {  
      port            = 80
      protocol        = "HTTP"
      forward = {
        target_group_key = "ecs-tg"
      }
    }
  }

  target_groups = {
    ecs-tg = {
      name_prefix = "h1"
      create_attachment = false
      protocol    = "HTTP"
      port        = 80
      target_type = "instance"

      health_check = {
        path                = "/"
        protocol            = "HTTP"
        interval            = 120
        timeout             = 60
        healthy_threshold   = 2
        unhealthy_threshold = 2
      }
    }
  }
  tags = var.tags
}