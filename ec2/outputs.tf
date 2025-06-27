output "public_ip" {
  value = aws_instance.public_vm.public_ip
}

output "private_instance_id" {
  value = aws_instance.private_vm.id
}
