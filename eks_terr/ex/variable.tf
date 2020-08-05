variable "project" {
  default = "myown"
}
variable "purpose" {
  default = "learning"
}
variable "vpc_id" {
  default = "vpc-0382ad828b646111a"
}
# variable "public_az" {
#   default = "b"
# }
variable "ami" {
  default = "ami-03b6f27628a4569c8"
}

variable "instance_type" {
  default = "t2.micro"
}
locals {
  worker_node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.demo.endpoint}' --b64-cluster-ca '${aws_eks_cluster.demo.certificate_authority.0.data}' '${var.cluster-name}'
USERDATA
}
