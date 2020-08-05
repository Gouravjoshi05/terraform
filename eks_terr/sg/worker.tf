resource "aws_security_group" "worker_node" {
  name        = "terraform-eks-worker-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "worker-${var.purpose}-${var.project}"
    Project    = var.project
    Purpose    = var.purpose
    type = "worker"
  }
}

resource "aws_security_group_rule" "worker_self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.worker_node.id
  source_security_group_id = aws_security_group.worker_node.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "worker_cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node.id
  source_security_group_id = aws_security_group.master_node.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "worker-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.master_node.id}"
  source_security_group_id = "${aws_security_group.worker_node.id}"
  to_port                  = 443
  type                     = "ingress"
}
