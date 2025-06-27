output "public_ip" {
  value = module.ec2.public_ip
}

output "private_instance_id" {
  value = module.ec2.private_instance_id
}

output "private_key_path" {
  value = module.ssh.private_key_path
}
