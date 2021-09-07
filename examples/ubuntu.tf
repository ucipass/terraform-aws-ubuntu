provider "aws" {
  profile = var.AWS_PROFILE
  region = var.AWS_REGION
  # version = "~> 2.3"
}


module "ubuntu" {
  source  = "../"
  name = "TEST"
  subnet_public_id = module.vpc.public_subnets[0]
  subnet_private_id = module.vpc.private_subnets[0]
  security_group_public_id = module.sg_public.security_group_id
  security_group_private_id = module.sg_private.security_group_id
  key_name = "AA"
}