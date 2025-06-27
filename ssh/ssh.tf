resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.key.private_key_pem
  filename = "${path.module}/id_rsa"
  file_permission = "0400"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "generated-key"
  public_key = tls_private_key.key.public_key_openssh
}
