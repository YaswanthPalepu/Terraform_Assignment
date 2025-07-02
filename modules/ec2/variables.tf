variable "vpc_id" {
    description = "this is vpc id"
    type = string
}
variable "public_subnet_id" {
    description = "this is public subnet id"
    type = string
}
variable "private_subnet_id" {
    description = "this is privatesubnet id"
    type = string
}
variable "key_name" {
    description = "this is key name"
    type = string
}
variable "instance_type" {
    description = "this is instance type"
    type = string
}
variable "ami_id" {
    description = "this is ami id"
    type = string
}
variable "public_tag" {
    description = "this public tag"
    type = string
}
variable "private_tag" {
  description = "this is private tag"
  type = string
}
variable "public_ip" {
  description = "this boolean value of ip address"
  type = bool
  default = true
}
variable "public_sg_id" {
  description = "Security group ID for public instance"
  type        = string
}

variable "private_sg_id" {
  description = "Security group ID for private instance"
  type        = string
}