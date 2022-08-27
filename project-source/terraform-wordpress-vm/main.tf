module "my_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs            = var.vpc_azs
  public_subnets = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = local.common_tags
}

resource "aws_instance" "wordpress" {
  ami                    = data.aws_ami.wordpress.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg_web.id]

  subnet_id = module.my_vpc.public_subnets[0]

  tags = local.common_tags
}

resource "aws_eip" "my_eip" {
  vpc      = true
  instance = aws_instance.wordpress.id

  tags = local.common_tags
}
