# No variables needed for now
variable "algorithm" {
  description = "type of algorithm using"
  type = string
}
variable "rsa_bits" {
  description = "number of bits for algorithm"
  type = number
}
variable "key_name" {
  description = "name of the key to generate"
  type = string
}
variable "filename" {
  description = "name of the file"
  type = string
}