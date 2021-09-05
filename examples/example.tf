provider "aws" {
  profile = var.AWS_PROFILE
  region = var.AWS_REGION
  version = "~> 2.3"
}

module "ubuntu" {
  source  = "ucipass/ubuntu/aws"
  version = "0.0.2"
}