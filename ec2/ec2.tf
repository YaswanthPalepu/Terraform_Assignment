# Security Group for Public Instance (NGINX + SSH)
resource "aws_security_group" "public_sg" {
  name   = "public_sg"
  vpc_id = module.networking.aws_vpc.custom_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public EC2 with NGINX
resource "aws_instance" "public_vm" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = module.networking.aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = module.ssh.aws_key_pair.generated.key_name
  vpc_security_group_ids      = [aws_security_group.public_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = { Name = "public_vm" }
}

# Private EC2 (No public IP)
resource "aws_instance" "private_vm" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = module.networking.aws_subnet.private_subnet.id
  key_name               = module.ssh.aws_key_pair.generated.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = { Name = "private_vm" }
}
