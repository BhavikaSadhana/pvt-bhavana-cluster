resource "aws_security_group" "bastion_sg" {
  name        = "${var.cluster_name}-bastion-sg"
  description = "Allow SSH access to bastion host"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = {
    Name = "${var.cluster_name}-bastion-sg"
  }
}

resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.cluster_name}-bastion"
  }
}
