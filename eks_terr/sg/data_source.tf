# data "aws_vpcs" "myvpc" {
#  vpc_id = "${var.vpc_id}"
#  filter {
#    name   = "tag:Name"
#    values = ["myvpc"]
#  }
# }

# data "aws_subnet_ids" "public" {
#  #vpc_id = "${var.vpc_id}"
#  vpc_id = data.aws_vpcs.myvpc.id
#  filter {
#    name   = "tag:type"
#    values = ["public"]
#  }
# }
# data "aws_subnet_ids" "private" {
#  #vpc_id = "${var.vpc_id}"
#   vpc_id = data.aws_vpcs.myvpc.id
#  filter {
#    name   = "tag:type"
#    values = ["private"]
#  }
# }
