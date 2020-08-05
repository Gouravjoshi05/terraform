provider "aws" {
    region = "ap-southeast-1"
    profile = "kunal"
}
resource "aws_launch_configuration" "eks" {
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.worker_node.name
  image_id                    = var.ami
  instance_type               = var.instance_type
  name_prefix                 = "terraform-eks-node"
  security_groups             = [aws_security_group.worker_node.id]
  user_data_base64            = "${base64encode(local.demo-node-userdata)}"

  lifecycle {
    create_before_destroy = true
  }
}
