data "aws_route53_zone" "my_zone" {
  name         = "nar3kjan.link"
  private_zone = false
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "nar3kjan.link"
  zone_id      = data.aws_route53_zone.my_zone.id

  subject_alternative_names = [
    "*.nar3kjan.link",
    "app.sub.nar3kjan.link",
  ]

  wait_for_validation = true

  tags = {
    Name = "nar3kjan.link"
  }
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = data.aws_route53_zone.my_zone.name

  records = [
    {
      name    = ""
      type    = "A"
      alias   = {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },

    {
      name    = "www"
      type    = "A"
      alias   = {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    }
  ]

}