variable "vpcid" {
  description = "VPC ID"
}
variable "cidr_block" {
  description = "CIDR Block for route table"
}
variable "igwid" {
  description = "IGW ID"
  default = ""
}
variable "natgw" {
  description = "Nat Gateway ID"
  default = ""
}
variable "natinstance" {
  description = "Nat Instance ID"
  default = ""
}
variable "rt_name" {
  description = "Tags For Route Table"
}

#variable "cidr_block_tunnel" { }
#variable "natinstance_tunnel" { }
#variable "nicid_tunnel" { }
