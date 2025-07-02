variable "vpc_cidr" {
    description = "this is cidr range of vpc"
    type = string
}
variable "public_subnet_cidr" {
    description = "this is cidr range of public subnet"
    type = string
}
variable "private_subnet_cidr" {
    description = "this is cidr range of private subnet"
    type = string
}
variable "region" {
    description = "this is aws region"
    type = string
}
variable "cidr_block" {
  description = "this is cidr block that allow traffic from outside"
  type = string
}
variable "map_public_ip_on_launch" {
  description = "to launch ip address on public subnet"
  type = bool
  default = true
}
