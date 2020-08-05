output "aws_iam_role" {
  value = "${aws_iam_role.eks_role.*.arn}"
}
# output "aws_private_subnets" {
#   value = "${aws_subnet.private_subnet.*.id}"
# }
