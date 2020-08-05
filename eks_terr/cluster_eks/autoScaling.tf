# resource "aws_autoscaling_group" "eks" {
#   desired_capacity     = 1
#   launch_configuration = aws_launch_configuration.eks.id
#   max_size             = 2
#   min_size             = 1
#   name                 = "terraform-eks-node"
#   vpc_zone_identifier  = data.aws_subnet_ids.public.ids
#
#   tags = {
#     Name = var.project-var.purpose
#     project = var.project
#     purpose = var.purpose
#   }
# }
