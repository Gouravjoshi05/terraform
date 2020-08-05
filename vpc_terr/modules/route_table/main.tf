resource "aws_route_table" "rt" {
  vpc_id = "${var.vpcid}"
  route {
    cidr_block = "${var.cidr_block}"
    gateway_id = "${var.igwid}"
    nat_gateway_id = "${var.natgw}"
    instance_id = "${var.natinstance}"
  }
#  route {
#    cidr_block = "${var.cidr_block_tunnel}"
#    instance_id = "${var.natinstance_tunnel}"
#    network_interface_id = "${var.nicid_tunnel}"
#  }
  tags = {
    Name = "${var.rt_name}"
  }
}
