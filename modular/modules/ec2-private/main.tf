resource "aws_security_group" "private_sg" {
  name   = "${var.name}-private-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  associate_public_ip_address = false
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = { Name = "${var.name}-private-ec2" }
}
