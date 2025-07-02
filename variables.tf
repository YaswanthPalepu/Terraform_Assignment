variable "region" {
    description = "defines the region"
    type = string
}
variable "vpc_cidr" {
    description = "cidr range of vpc"
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
variable "cidr_block" {
  description = "this is cidr block that allow traffic from outside"
  type = string
}
variable "algorithm" {
  description = "type of algorithm using"
  type = string
}
variable "rsa_bits" {
  description = "number of bits for algorithm"
  type = number
}
variable "filename" {
  description = "name of the file"
  type = string
}
variable "key_name" {
  description = "name of the key to generate"
  type = string
}
