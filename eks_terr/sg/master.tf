provider "aws" {
    region = "ap-southeast-1"
    profile = "kunal"
}
resource "aws_security_group" "master_node" {
  name        = var.purpose
  description = "sg for rabbitmq"
  vpc_id = var.vpc_id

  tags = {
    Name       = "master-${var.purpose}-${var.project}"
    Project    = var.project
    Purpose    = var.purpose
    type       = "master"
  }

  #Access_RULE
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
