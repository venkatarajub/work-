resource "aws_instance" "ansible" {
  ami                     = var.ami_id
  instance_type           = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Ansible-server"
  } 
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh on port number 22"
  vpc_id      = "vpc-0708b2cf68b37a8c4"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "Ansible_sg"
  }
}