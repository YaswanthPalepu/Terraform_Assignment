provider "aws" {
  region = var.region
}

module "networking" {
  source               = "./modules/networking"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  region              = var.region
  cidr_block = var.cidr_block
}

module "ssh_key" {
  source = "./modules/ssh_key"
  algorithm = var.algorithm
  rsa_bits = var.rsa_bits
  key_name = var.key_name
  filename = var.filename
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  key_name          = module.ssh_key.key_name
  public_sg_id      = module.networking.public_sg_id
  private_sg_id     = module.networking.private_sg_id
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  public_tag = var.public_tag
  private_tag = var.private_tag
}
