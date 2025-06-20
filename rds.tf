resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow ECS traffic to RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "MySQL from ECS"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups        = ["sg-04c817dc23057e4e7"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "devopsdb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "devopsdb"
  username = "admin"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-04d67ff4060bc5e15"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = ["subnet-0606cd659a78079e5", "subnet-07de51c4957145e41"]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

}