data "aws_ami" "latest_packer_image" {
  owners = ["558664324013"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu-nginx*"]
  }
}

module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "Development-asg"

  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  health_check_type         = "EC2"
  vpc_zone_identifier       = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  target_group_arns = [module.alb.target_group_arns]

  
  # Launch template
  launch_template_name        = "Development-asg"
  launch_template_description = "Ubuntu_Nginx"
  update_default_version      = true

  image_id          = data.aws_ami.latest_packer_image.id
  instance_type     = "t2.micro"
  ebs_optimized     = true
  enable_monitoring = true

}