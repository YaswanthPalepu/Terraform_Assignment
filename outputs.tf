output "public_instance_ip" {
  value = module.ec2.aws_instance.public_vm.public_ip
}

output "private_key_path" {
  value = module.ssh.local_file.private_key.filename
}
