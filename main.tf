provider "aws" {
  region = var.region
}

module "networking" {
  source = "./networking"
}

module "ssh" {
  source = "./ssh"
}

module "ec2" {
  source = "./ec2"
}
