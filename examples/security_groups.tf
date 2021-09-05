module "sg_public" {
  depends_on = [module.vpc]
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.name}_sg_public"
  description = "Security group for public interface"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = -1
      description = "ALL-INBOUND"
      cidr_blocks = "0.0.0.0/0"
    }
  ]  

  egress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = -1
      description = "ALL-OUTBOUND"
      cidr_blocks = "0.0.0.0/0"
    }
  ]  
}

module "sg_private" {
  depends_on = [module.vpc]
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.name}_sg_private"
  description = "Security group for private interface"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = -1
      description = "ALL-INBOUND"
      cidr_blocks = "0.0.0.0/0"
    }
  ]  

  egress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = -1
      description = "ALL-OUTBOUND"
      cidr_blocks = "0.0.0.0/0"
    }
  ]  
}
