# provider "aws" {
#     region = "ap-southeast-1"
#     profile = "kunal"
# }
resource "aws_iam_role" "worker_node" {
  name = "terraform-eks-worker-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
tags = {
  type = "worker"
}
}

resource "aws_iam_role_policy_attachment" "worker_node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.worker_node.name}"
}

resource "aws_iam_role_policy_attachment" "worker_node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.worker_node.name}"
}

# resource "aws_iam_role_policy_attachment" "worker_node-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = "${aws_iam_role.demo-node.name}"
# }

resource "aws_iam_instance_profile" "worker_node" {
  name = "terraform-eks-worker_node"
  role = "${aws_iam_role.worker_node.name}"
}
