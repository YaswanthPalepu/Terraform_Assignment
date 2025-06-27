provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./networking"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ssh" {
  source = "./ssh"
}

module "ec2" {
  source         = "./ec2"
  vpc_id         = module.networking.vpc_id
  public_subnet  = module.networking.public_subnet_id
  private_subnet = module.networking.private_subnet_id
  key_name       = module.ssh.key_name
}
