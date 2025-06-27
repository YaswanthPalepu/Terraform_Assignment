output "public_instance_ip" {
  value = module.ec2.aws_instance.public_vm.public_ip
}

output "private_key_file" {
  value       = module.ssh.local_file.private_key.filename
  sensitive   = true
  description = "Path to the generated private key (DO NOT push this key to GitHub)"
}

output "private_instance_id" {
  value = module.ec2.aws_instance.private_vm.id
}
