module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "nar3kjan.link"
  zone_id      = module.zones.route53_zone_zone_id

  subject_alternative_names = [
    "*.nar3kjan.link",
    "app.sub.nar3kjan.link",
  ]

  wait_for_validation = true

  tags = {
    Name = "nar3kjan.link"
  }
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "nar3kjan.link" = {
      comment = "nar3kjan.link (production)"
      tags = {
        env = "production"
      }
    }

    "myapp.com" = {
      comment = "myapp.com"
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  records = [
    {
      name    = "nar3kjan.link"
      type    = "A"
      alias   = {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www"
      type    = "A"
      ttl     = 3600
      records = [
        "10.10.10.10",
      ]
    },
  ]

  depends_on = [module.zones]
}