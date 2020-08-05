output "aws_master_sg" {
  value = "${aws_security_group.master_node.*.id}"
}
output "aws_worker_sg" {
  value = "${aws_security_group.worker_node.*.id}"
}
# output "aws_private_subnets" {
#   value = "${aws_subnet.private_subnet.*.id}"
# }
