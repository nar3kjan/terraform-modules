module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [aws_security_group.dev_sg.id]



  target_groups = [
    {
      name_prefix      = "Public1"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = module.ec2_instance.id[0]
          port = 80
        }
        my_other_target = {
          target_id = module.ec2.instance.id[1]
          port = 80
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate.cert.arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Dev"
  }
}