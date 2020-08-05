resource "aws_eip" "nat_ip" {
    vpc           = true
tags = {
    Name          = "${var.eip_name}"
  }
}

resource "aws_nat_gateway" "nat_gw" {
    allocation_id = "${aws_eip.nat_ip.id}"
    subnet_id     = "${var.pub_subnet_id}"

tags = {
    Name          = "${var.nat_name}"
  }
#    depends_on    = ["${var.aws_igw}"]
}
