resource "aws_secretsmanager_secret" "db_credentials" {
  name = "mysql-ecs-credentials"
}
