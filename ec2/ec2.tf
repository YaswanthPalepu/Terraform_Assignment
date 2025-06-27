resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

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

resource "aws_instance" "public_vm" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Public-VM"
  }
}

resource "aws_instance" "private_vm" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "Private-VM"
  }
}
