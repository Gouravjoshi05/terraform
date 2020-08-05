#data "aws_region" "current" {}
data "aws_subnet_ids" "public" {
 vpc_id = "${var.vpc_id}"
 filter {
   name   = "tag:type"
   values = ["public"]
 }
}
data "aws_subnet_ids" "private" {
 vpc_id = "${var.vpc_id}"
 filter {
   name   = "tag:type"
   values = ["private"]
 }
}
data "aws_iam_role" "eksrole" {
  name = "terraform-eks-cluster"
}

data "aws_security_group" "worker_node"{
  vpc_id = "${var.vpc_id}"
  filter {
  name = "tag:type"
  values = ["worker"]
  }
}

data "aws_security_group" "master_node"{
  vpc_id = "${var.vpc_id}"
  filter {
  name = "tag:type"
  values = ["master"]
  }
}

data "iam_instance_profile" "worker_node" {
  filter {
    type = "worker"
  }
}
