# provider "iam" {
#     region = "ap-southeast-1"
#     profile = "kunal"
# }
resource "aws_eks_cluster" "eks" {
  name     = "eks"
  role_arn = "${data.aws_iam_role.eksrole.arn}"
  #role_arn = "arn:aws:iam::192624646193:role/aws_eks_clusterole"

  vpc_config {
    subnet_ids = data.aws_subnet_ids.public.ids
  }
  # tags = {
  #     Name       = "${var.purpose}"
  #     Decription = "${var.purpose} vpc private subnet with direct access to internet"
  #     purpose    = "${var.purpose}"
  #     Project    = "${var.project}"
  #   }
}
