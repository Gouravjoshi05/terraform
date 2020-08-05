resource "aws_internet_gateway" "gw" {
  vpc_id = "${var.vpcid}"
  tags = {
    Name = "${var.igw_name}"
  }
}
