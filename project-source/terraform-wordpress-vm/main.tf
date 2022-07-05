module "my_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = local.common_tags
}

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.ubuntu_focal.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg_web.id]

  tags = local.common_tags
}

resource "aws_eip" "my_eip" {
  vpc      = true
  instance = aws_instance.my_instance.id

  tags = local.common_tags
}
