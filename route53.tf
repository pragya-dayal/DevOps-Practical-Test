resource "aws_route53_record" "www" {
  zone_id = "Z07998751MGPA9B6K0CHM"
  name    = "pragya.devops.com"
  type    = "CNAME"
  ttl     = 300
  records = ["devops-practical-617891593.eu-west-1.elb.amazonaws.com"]
}

resource "aws_route53_zone" "devops_zone" {
  name = "devops.com"
}