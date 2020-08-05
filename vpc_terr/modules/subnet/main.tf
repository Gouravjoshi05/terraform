resource "aws_subnet" "main" {
  vpc_id = "${var.vpcid}"
  cidr_block = "${var.cidr}"
  availability_zone = "${var.az}" 
  tags = {
    Name = "${var.subnet_name}"
  }
}
