data "aws_ami" "latest_packer_image" {
  owners = ["558664324013"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu-nginx*"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two"])

  name = "instance-${each.key}"

  ami                    = data.aws_ami.latest_packer_image.id
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  subnet_id              = element(module.vpc.public_subnets, count.index) 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

